//선택변경 patient_auto
function fnSelectChange(idx, data, column, regist_dt, event, trigger) {
    if (data == 'checkbox' || column == 'col12' || column == 'col05') {
        var index_id = '#' + column;
        index_id = index_id + idx;
        var data = '';
        if ($(index_id).is(":checked") == true) {
            data = 'Y';
        } else {
            data = 'N';
        }
    }
    //특수값으로 판단
    var change_main = 0;
    switch (column) {
        case "select_yn":
            if (data == 'N') {
                if (!confirm("미체크 시 [담당의사,담당자,상담자,진료의사...] 선택옵션에서 노출 안됩니다. \n취소 하시겠습니까?")) {
                    $(index_id).prop("checked", true);
                    return false;
                }
            }
            break;
        case "chair_idx":
        case "status":
            break;
        // 담당자변경
        case "charge_id":
        case "medical_doctor_id":
        case "consultant_id":
        case "doctor_id":
            if (column == 'charge_id') str = "담당자";
            if (column == 'consultant_id') str = "상담자";
            if (column == 'medical_doctor_id') str = "담당의사";
            if (column == 'doctor_id') str = "상담의사";
            if (confirm("환자의 메인" + str + "도 함께 변경을 하시겠습니까?")) {
                change_main = 1;
            }
            break;
        default:
            break;
    }
    var params = {
        idx: idx,
        data: data,
        regist_dt: regist_dt,
        column: column,
        change_main: change_main
    };
    console.log(params);
    $.ajax({
        url: im_patient_url + "/select_proc.php",
        type: "POST",
        data: params,
        dataType: "text",
        success: function (data) {
            im_notice('저장되었습니다');
            if (event && typeof ((new Function(event))()) == "function") {
                (new Function(event))();
            } else {
                if (trigger) {
                    trigger && (triggers = trigger.split(','));
                    triggers && triggers.length && $.each(triggers, function (index, value) {
                        $(triggers[index]).trigger("click");
                    });
                }
            }
            console.log(data);
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function fnSelectChange_new(idx, data, column, regist_dt, event, trigger, no) {
    var pressed = document.pressed;
    var params = {};
    if (data == 'checkbox') {
        var ss = '#' + column;
        ss = ss + idx;
        var data = '';
        if ($(ss).is(":checked") == true) {
            data = 'Y';
        } else {
            data = 'N';
        }
    }
    //특수값으로 판단
    var change_main = 0;
    switch (column) {
        case "chair_idx":
        case "status":
            switch (data) {
                case '환자호출':
                case '의사호출':
                    if (!confirm("" + data + " 하시겠습니까?")) {
                        return false;
                    }
                    break;
                default:
                    break;
            }
            break;
        // 담당자변경
        case "charge_id":
        case "medical_doctor_id":
        case "consultant_id":
        case "doctor_id":
            if (column == 'charge_id') str = "담당자";
            if (column == 'consultant_id') str = "상담자";
            if (column == 'medical_doctor_id') str = "담당의사";
            if (column == 'doctor_id') str = "상담의사";
            if (confirm("환자의 메인" + str + "도 함께 변경을 하시겠겠습니까?")) {
                change_main = 1;
            }
            break;
        default:
            break;
    }
    var params = {
        idx: idx,
        data: data,
        regist_dt: regist_dt,
        column: column,
        change_main: change_main
    };
    console.log(params);
    $.ajax({
        url: im_patient_url + "/select_proc.php",
        type: "POST",
        data: params,
        dataType: "json",
        success: function (data) {
            console.log(data);
            if (data) {
                // 성공
                if (data.result == 'suc') {
                    im_notice('저장되였습니다.');
                    if (event) {
                        switch (event) {
                            case "reload":
                                location.reload();
                                break;
                        }
                        if (typeof ((new Function(event))()) == "function") {
                            (new Function(event))();
                        }
                    } else {
                        try {
                            if (trigger) {
                                trigger && (triggers = trigger.split(','));
                                triggers && triggers.length && $.each(triggers, function (index, value) {
                                    $(triggers[index]).trigger("click");
                                });
                            }
                        } catch (e) { }
                    }
                } else {
                    // 실패
                    if (data.error) {
                        alert(data.error);
                        location.reload();
                    } else {
                        alert("저장실패!");
                        location.reload();
                    }
                    if (event && typeof ((new Function(event))()) == "function") {
                        ((new Function(event))());
                    } else {
                        try {
                            if (trigger) {
                                trigger && (triggers = trigger.split(','));
                                triggers && triggers.length && $.each(triggers, function (index, value) {
                                    $(triggers[index]).trigger("click");
                                });
                            }
                        } catch (e) { }
                    }
                }
            } else {
                alert("저장실패!\n data 값이 없습니다.")
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}
