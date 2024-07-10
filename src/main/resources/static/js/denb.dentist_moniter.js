var _denbMonitor = self.setInterval("denbMonitor()", 3000);

function denbMonitor() {
    var today = new Date();
    var hours = today.getHours();
    if (hours < 5 && hours > 0) {
        return false;
    }
    var params = {
        dentist_idx: im_dentist_idx,
        cf_group_idx: im_cf_group_idx,
        user_id: im_user_id,
    }
    $.post((im_include_url + "/moniter.php"), params).done(function (data) {
        data && (obj = $.parseJSON(data)); // json obj
        // console.log("모니터링:");
        // console.log(obj);
        if (obj != null) {
            // 현재 버전 체크
            // 버전 차이 있으면 리셋
            if (obj.work != null) {
                if (obj.work.result == "reload") {
                    if (obj.work.cnt > 0) {
                        $(".navbar-top-links #head_work_counting").html(obj.work.cnt).show();
                    } else {
                        $(".navbar-top-links #head_work_counting").html(obj.work.cnt).hide();
                    }
                }
            }

            if (obj.arrange.patient_idx != null) {
                var title = "[ " + obj.arrange.patient_nm + " ] 님 안녕하세요";
                title = title + "<br>";
                title = title + "<br>치료받는 도중 불편한것이 있으시면";
                title = title + "<br>카카오톡 진료확인표에 문의를 꼭 남겨주세요.";
                title = title + "<br>";
                title = title + "<br>곧 디지털 시스템진료를 시작하겠습니다.";
                title = title + "<br>";
                title = title + "<br>AI 자동 맞춤된 치료컨텐츠는 내 진료와 연계된";
                title = title + "<br>내용으로 구성되어 있습니다";
                title = title + "<br>";
                title = title + "<br>진료전 필수확인!";
                var text = "<button class='btn btn-info m-0' data-toggle=\"fnModalForm\" data-patient_idx=\"" + obj.arrange.patient_idx + "\" data-no=\"" + obj.arrange.no + "\" data-type=\"widget_tab_patient_order\" data-tab_id=\"widget_patient_implement_ag\">내 진료컨텐츠 바로가기</button>";
                swal({
                    html: true,
                    title: title,
                    text: text,
                    contentt: text,
                    type: "warning",
                    timer: 30000,
                    confirmButtonText: "포스트잇 바로 확인하기",
                    cancelButtonText: "다시 확인 안하기",
                    closeOnConfirm: false,
                    showCancelButton: true,
                },
                    function (isConfirm) {
                        swal.close();
                        console.log(isConfirm);
                        if (isConfirm == false) {
                            // 체어 확인 수정
                            fnSelectChange(obj.arrange.idx, obj.arrange.idx, 'chair_confirm_yn');
                        }
                        if (isConfirm == true) {
                            // 다시확인 안하기
                            fnSelectChange(obj.arrange.idx, obj.arrange.idx, 'chair_confirm_yn');
                            var params = {};
                            params.patient_idx = obj.arrange.patient_idx;
                            params.regist_dt = obj.arrange.regist_dt;
                            params.no = obj.arrange.no;
                            params.type = 'widget_tab_patient_order';
                            params.tab_id = 'arrange_postit';
                            console.log(params);
                            fnModalForm(params);
                        }
                    }
                );
            }

            // 신규 환자 메모가 있을시 파업창 자동 켜기
            if (obj.arrange.patient_memo_cnt != null) {
                try {
                    if (obj.arrange.patient_memo_cnt > 0) {
                        if ($('#small-chat').is('.active')) {
                            fnLoadWidget("widget_patient_memo_chatting_list_small");
                            $('#pateint_memo_log_cnt').html("0");
                        } else {
                            $('#pateint_memo_log_cnt').html(obj.arrange.patient_memo_cnt);
                            $('#pateint_memo_log_cnt').addClass("badge-danger");
                            $('#pateint_memo_log_cnt').removeClass("badge-white");
                        }
                    } else {
                        $('#pateint_memo_log_cnt').html(obj.arrange.patient_memo_cnt);
                        $('#pateint_memo_log_cnt').removeClass("badge-danger");
                        $('#pateint_memo_log_cnt').addClass("badge-white");
                    }
                } catch (e) {
                    console.log("error:denbMonitor")
                }
            }

            // 포스트잇 체크
            if (obj.arrange.count_label != null) {
                try {
                    $.each(obj.arrange.count_label, function (i, v) {
                        var o = $(".count_label" + i).find('.label');
                        var b = $(".count_label" + i).find('.badge');
                        var so = $(".right-sidebar-" + i).find('.label');
                        var sb = $(".right-sidebar-" + i).find('.badge');
                        if (v > 0) {
                            o.removeClass('hidden').text(v).show();
                            b.removeClass('hidden').text(v).show();
                            so.removeClass('hidden').text(v).show();
                            sb.removeClass('hidden').text(v).show();
                        } else {
                            o.addClass('hidden').text('').hide();
                            b.removeClass('hidden').text(v).hide();
                            so.removeClass('hidden').text(v).hide();
                            sb.removeClass('hidden').text(v).hide();
                        }
                    })
                } catch (e) {
                    console.log("error:denbMonitor")
                }
            }

            // 파업고지
            try {
                var notify_cnt = obj.notification.arrange.cnt;
                if (notify_cnt > 0) {
                    var audio = new Audio('../aws_voice/notify.wav');
                    audio.play();
                    var rows = obj.notification.arrange.row;
                    $.each(rows, function (i, v) {
                        var set_options = {};
                        console.log(v);
                        set_options.title = v.patient_title;
                        set_options.description = v.description;

                        v.type && (set_options.type = v.type);
                        v.status && (set_options.status = v.status);
                        v.closeTimeout && (set_options.closeTimeout = v.closeTimeout);
                        v.patient_idx && (set_options.patient_idx = v.patient_idx);
                        v.no && (set_options.no = v.no);
                        console.log(set_options);

                        im_notification(set_options);
                    })
                }
            } catch (e) {
                // console.log("error:notify_cnt")
            }
        }
    });
};