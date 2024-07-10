!(function () {
  if (jQuery && jQuery.fn && jQuery.fn.select2 && jQuery.fn.select2.amd)
    var n = jQuery.fn.select2.amd;
  n.define("select2/i18n/ko", [], function () {
    return {
      errorLoading: function () {
        return "결과를 불러올 수 없습니다.";
      },
      inputTooLong: function (n) {
        return (
          "너무 깁니다. " + (n.input.length - n.maximum) + " 글자 지워주세요."
        );
      },
      inputTooShort: function (n) {
        return " " + (n.minimum - n.input.length) + " 글자 이상 입력해주세요.";
      },
      loadingMore: function () {
        return "불러오는 중…";
      },
      maximumSelected: function (n) {
        return "최대 " + n.maximum + "개까지만 선택 가능합니다.";
      },
      noResults: function () {
        return "결과가 없습니다.";
      },
      searching: function () {
        return "검색 중…";
      },
      removeAllItems: function () {
        return "모든 항목 삭제";
      },
    };
  }),
    n.define,
    n.require;
})();
+(function ($) {
  $(function () {
    $.fn.dropdown.Constructor.prototype.change = function (e) {
      e.preventDefault();
      var $item = $(e.target),
        $select,
        $checked = false,
        $menu,
        $label,
        $eval;
      !$item.is("a") && ($item = $item.closest("a"));
      $menu = $item.closest(".dropdown-menu");
      $eval = $menu.data("eval");
      $label = $menu.parent().find(".dropdown-label");
      $labelHolder = $label.text();
      $select = $item.find("input");
      $checked = $select.is(":checked");
      if ($select.is(":disabled")) return;
      if ($select.attr("type") == "radio" && $checked) return;
      if ($select.attr("type") == "radio")
        $menu.find("li").removeClass("active");
      $item.parent().removeClass("active");
      !$checked && $item.parent().addClass("active");
      $select.prop("checked", !$select.prop("checked"));
      $items = $menu.find("li > a > input:checked");
      if ($items.length) {
        $text = [];
        $items.each(function () {
          var $str = $(this).parent().text();
          $str && $text.push($.trim($str));
        });
        $text =
          $text.length < 4 ? $text.join(", ") : $text.length + " selected";
        $label.html($text);
        $eval && eval($eval);
        console.log($eval);
      } else {
        $label.html($label.data("placeholder"));
      }
    };
    $(document).on(
      "click.dropdown-menu",
      ".dropdown-select > li > a",
      $.fn.dropdown.Constructor.prototype.change
    );
  });
})(jQuery);

$(document).ready(function () {
  // Fast fix bor position issue with Propper.js
  // Will be fixed in Bootstrap 4.1 - https://github.com/twbs/bootstrap/pull/24092
  Popper.Defaults.modifiers.computeStyle.gpuAcceleration = false;
  // Add body-small class if window less than 768px
  if (window.innerWidth < 769) {
    $("body").addClass("body-small");
  } else {
    $("body").removeClass("body-small");
  }

  // MetisMenu
  var sideMenu = $("#side-menu").metisMenu();
  // Collapse ibox function

  $("i#patient_popover").mouseenter(function () {
    var i = this;
    var patient_idx = $(this).data("idx");
    var div_id = "patient_popover_html" + patient_idx;
    var data = {
      patient_idx: patient_idx,
      widget_type: "popover",
    };
    /* var params = {};
        params['widget_type'] = "popover"; */
    $.ajax({
      url: "../widget/widget_patient_info.php",
      type: "POST",
      data: data,
      dataType: "text",
      success: function (html) {
        $(i).popover({
          // placement: 'top',
          delay: {
            show: "100",
            hide: "50",
          },
          html: true,
          trigger: "hover",
          content: html,
          container: "body",
        });
      },
    });
  });

  // Close ibox function
  $(".close-link").on("click", function (e) {
    e.preventDefault();
    var content = $(this).closest("div.ibox");
    content.remove();
  });

  // Fullscreen ibox function
  $(".fullscreen-link").on("click", function (e) {
    e.preventDefault();
    var ibox = $(this).closest("div.ibox");
    var button = $(this).find("i");
    $("body").toggleClass("fullscreen-ibox-mode");
    button.toggleClass("fa-expand").toggleClass("fa-compress");
    ibox.toggleClass("fullscreen");
    setTimeout(function () {
      $(window).trigger("resize");
    }, 100);
  });

  // Close menu in canvas mode
  $(".close-canvas-menu").on("click", function (e) {
    e.preventDefault();
    $("body").toggleClass("mini-navbar");
    SmoothlyMenu();
  });

  // Run menu of canvas
  $("body.canvas-menu .sidebar-collapse").slimScroll({
    height: "100%",
    railOpacity: 0.9,
  });

  // Initialize slimscroll for small chat
  $(".small-chat-box .content").slimScroll({
    height: "434px",
    railOpacity: 0.4,
  });

  // Small todo handler
  $(".check-link").on("click", function () {
    var button = $(this).find("i");
    var label = $(this).next("span");
    button.toggleClass("fa-check-square").toggleClass("fa-square-o");
    label.toggleClass("todo-completed");
    return false;
  });

  // Append config box / Only for demo purpose
  // Uncomment on server mode to enable XHR calls
  //$.get("skin-config.html", function (data) {
  //    if (!$('body').hasClass('no-skin-config'))
  //        $('body').append(data);
  //});

  $("[data-toggle=tooltip]").tooltip();

  // Move right sidebar top after scroll
  $(window).scroll(function () {
    if ($(window).scrollTop() > 0 && !$("body").hasClass("fixed-nav")) {
      $("#right-sidebar").addClass("sidebar-top");
    } else {
      $("#right-sidebar").removeClass("sidebar-top");
    }
  });

  $("[data-toggle=popover]").popover();

  // Add slimscroll to element
  $(".full-height-scroll").slimscroll({
    height: "100%",
  });

  $('[data-toggle="checkstr"]').on("click", function (e) {
    var $this = $(e.target),
      $class,
      $target,
      data = [],
      ck_val,
      ck_name,
      $target = $this.data("target") || $this.attr("href"),
      ck_name = $this.attr("name"),
      closest_form_id = $this.closest("form").attr("id");
    ck_name = ck_name.replaceAll(/\[[^\]]*\]/g, ""); // [xx] 삭제
    console.log("ck_name:" + ck_name);
    console.log("closest_form_id:" + closest_form_id);
    $.each($("[name^='" + ck_name + "']"), function (i, e) {
      if (e.checked == true) {
        data[i] = e.value;
      }
    });
    console.log(data);
    data = data.filter((d) => d); //
    data.length && (ck_val = data.join(","));
    $target && ($targets = $target.split(","));
    $targets &&
      $targets.length &&
      $.each($targets, function (index, value) {
        if (closest_form_id)
          $("#" + closest_form_id + " #" + $targets[index]).val(ck_val);
        else $("#" + $targets[index]).val(ck_val);
      });
  });

  // 클릭 val 지정 폼값으로 변경
  $('[data-toggle="clickToValue"]').on("click", function (e) {
    var $this = $(e.target),
      $class,
      $target,
      $target = $this.data("target") || $this.attr("href");
    $ck_val = $this.attr("value");
    try {
      console.log($target);
      console.log($ck_val);
      $ck_val && $("#" + $target).val($ck_val);
    } catch (e) {
      console.log();
    }
  });

  // 체크박스 클릭시 해당 체크값 자동입력 기능
  $('[data-toggle="checkstr_new"]').on("click", function (e) {
    var $this = $(this),
      $target,
      $target_val,
      remove_data = [], // 삭제할내용
      add = true,
      this_val = $this.val(),
      ck_name,
      $target = $this.data("target") || $this.attr("href"),
      ck_name = $this.attr("name"),
      closest_form_id = $this.closest("form").attr("id");
    $target && (target_val = $("#" + $target).val()); // 대상값

    // console.log("this_val:" + this_val);
    // console.log("ck_name:" + ck_name);
    // console.log("closest_form_id:" + closest_form_id);
    // console.log("target_val:" + target_val.length);
    ck_name = ck_name.replaceAll(/\[[^\]]*\]/g, ""); // [xx] 삭제

    // 기존내용에서 ,가 포함된 내용 삭제
    remove_data[0] = ", " + this_val;
    remove_data[1] = this_val + ",";
    remove_data[2] = " " + this_val;
    remove_data[3] = this_val + " ";

    // 처크
    if ($(this).is(":checked") == true) {
      $.each(remove_data, function (index, value) {
        if (target_val.indexOf(value) > 0) {
          console.log("이미 있음:" + value);
          add = false;
          return false;
        }
      });
      add &&
        (target_val =
          target_val.length > 0 ? target_val + ", " + this_val : this_val);
    } else {
      $.each(remove_data, function (index, value) {
        if (target_val.indexOf(value) > 0) {
          target_val = target_val.replace(value, "");
          return false;
        }
      });
    }
    // console.log("new_target_val:" + target_val);
    target_val && $("#" + closest_form_id + " #" + $target).val(target_val);
  });

  /////////////////////////////////////////////////////////////////// ADD
  // 체크박스로 disabled 설정
  // data-target="#search_chart_no_start,#search_chart_no_end"

  $('[data-toggle="check_disabled"]')
    .each(function (i, e) {
      toggleDisabledState.call(this);
    })
    .on("change", toggleDisabledState);

  function toggleDisabledState() {
    var targetSelectors = $(this).data("target").split(",");
    for (var i = 0; i < targetSelectors.length; i++) {
      var targetElement = $(targetSelectors[i]);
      targetElement.prop("disabled", !$(this).prop("checked"));
    }
  }

  $("[data-toggle='valbutton']").on("click", function (e) {
    e && e.preventDefault();
    var val = $(this).val();
    var event = $(this).data("event");
    var target = $("#" + $(this).data("target"));
    target && target.val(val);
    if (event && typeof eval(event) == "function") {
      eval(event);
    }
    // 2023年6月22日 상용날짜 선택후 datepicker 클릭시 날짜부분 신규날짜로 셋팅
    if (target.length) {
      target.datepicker("setDate", val);
    }
  });
  $(".memonote, #memonote").summernote({
    name: "ko-KR",
    lang: "ko-KR",
    placeholder: "메모입력",
    lineHeight: "14",
    fontsize: "14",
    toolbar: [
      ["style", ["bold", "italic", "underline", "clear"]],
      ["color", ["color"]],
    ],
  });

  $("#Summernote").summernote({
    name: "ko-KR",
    lang: "ko-KR",
    placeholder: "메모입력",
    lineHeight: "14",
    fontsize: "14",
    toolbar: [
      ["style", ["bold", "italic", "underline", "clear"]],
      ["color", ["color"]],
    ],
  });
  // $('td').has('.form-control').addClass('no-padding');

  /* ################################################ */
  /* 파일 업로드수행 기능 php im_file_form 함께 사용*/
  bsCustomFileInput.init();
  /* ################################################ */
  $('[data-toggle="tooltip"]').tooltip();

  $(".im_select2").each(function () {
    var placeholder = $(this).attr("placeholder");
    placeholder = placeholder ? placeholder : "=선택=";
    var multiple = $(this).attr("multiple");
    closeOnSelect = multiple ? true : false;
    $(this).select2({
      theme: "bootstrap4",
      language: "ko",
      placeholder: placeholder,
      allowClear: true, // 비우기
    });
  });

  $(".modal_select2").each(function () {
    var placeholder = $(this).attr("placeholder");
    var tags = $(this).data("tags");
    placeholder = placeholder ? placeholder : "=선택=";
    tags = tags ? true : false;
    var multiple = $(this).attr("multiple");
    closeOnSelect = multiple ? true : false;
    $(this).select2({
      dropdownParent: $(".modal-body"), //  modal 필수
      theme: "bootstrap4",
      language: "ko",
      placeholder: placeholder,
      allowClear: true, // 비우기
    });
  });

  $(".im_select2_json_patient").each(function () {
    var placeholder = $(this).attr("placeholder");
    var tags = $(this).data("tags");
    placeholder = placeholder ? placeholder : "환자명,챠트번호,전화번호로 검색";
    tags = tags ? true : false;
    var multiple = $(this).attr("multiple");
    closeOnSelect = multiple ? true : false;
    $(this)
      .select2({
        // https://www.cnblogs.com/lujiahao/p/15433057.html
        // dropdownParent: $(".modal-body"), //  modal 필수
        theme: "bootstrap4",
        language: "ko",
        width: "100%",
        placeholder: placeholder,
        inputTooShort: "환자명,챠트번호,전화번호로 검색",
        minimumInputLength: 2,
        // allowClear: false, //
        allowClear: true, // 비우기
        ajax: {
          url: "../include/patient_json.php", // 接口地址
          dataType: "json",
          delay: 200, // 延迟显示
          cache: false,
          type: "POST",
          data: function (params) {
            return {
              search_patient_text: params.term,
              page: params.page || 1,
            };
          },
          processResults: function (data, params) {
            var datas = data.results;
            var options = [];
            $(datas).each(function (i, o) {
              options.push({
                id: o.id,
                text: '<p class="custom-class">' + o.text + "</span>",
                selection: o.selection,
              });
            });
            return {
              results: options,
            };
          },
        },
        templateResult: function (data) {
          if (!data.id) {
            return data.text; // 保持默认行为
          }
          return $(data.text);
        },
        templateSelection: function (data) {
          if (data.selection) {
            return data.selection; // 선택값
          }
          return data.text; // 保持默认行为
        },
      })
      .on("change", function (e) {
        var patient_idx = $(this).val();
        var href = $(this).data("url");
        var params = {};
        if (href) {
          params["patient_idx"] = patient_idx;
          params["type"] = "change_patient_idx";
          console.log(params);
          $.ajax({
            url: "../patient/select_proc.php",
            type: "POST",
            data: params,
            dataType: "text",
            delay: 250, // 延迟显示
            success: function (data) {
              no = data;
              no &&
                (location.href =
                  href + "?patient_idx=" + patient_idx + "&no=" + data);
            },
            error: function (request, status, error) {
              alert(
                "code:" +
                  request.status +
                  "\n" +
                  "message:" +
                  request.responseText +
                  "\n" +
                  "error:" +
                  error
              );
            },
          });
        }
      });
  });
  $(".im_select2_json_patient_m").each(function () {
    var placeholder = $(this).attr("placeholder");
    var tags = $(this).data("tags");
    placeholder = placeholder ? placeholder : "환자명,챠트번호,전화번호로 검색";
    tags = tags ? true : false;
    var multiple = $(this).attr("multiple");
    closeOnSelect = multiple ? true : false;
    $(this).select2({
      // https://www.cnblogs.com/lujiahao/p/15433057.html
      dropdownParent: $("#modal-body"), //  modal 필수
      theme: "bootstrap4",
      language: "ko",
      width: "100%",
      placeholder: placeholder,
      inputTooShort: "환자명,챠트번호,전화번호로 검색",
      minimumInputLength: 2,
      allowClear: true,
      ajax: {
        url: "../include/patient_json.php", // 接口地址
        dataType: "json",
        delay: 250, // 延迟显示
        cache: false,
        type: "POST",
        data: function (params) {
          // console.log(params);
          return {
            search_patient_text: params.term,
            page: params.page || 1,
          };
        },
        results: function (data, params) {
          console.log(data);
          var datas = data.results;
          var options = new Array();
          $(datas).each(function (i, o) {
            options.push({
              id: o.id,
              text: o.text,
            });
          });
          return {
            results: options,
          };
        },
      },
    });
  });

  // 캘린더 기본옵션
  //https://bootstrap-datepicker.readthedocs.io/
  $(
    "#search_start_dt, #next_reserve_dt, #search_end_dt, #search_dt, .dateinput, input[id^='briefing_dt'], input[data-type='date'],input[data-type='dateIso'], #cure_end_dt, #final_recall_dt, #birth, #entered_dt, #opening_dt, #resignation_dt, #expect_briefing_dt, #payment_expect_dt, #join_dt, #expenditure_dt, #start_day, #end_day"
  ).datepicker({
    format: "yyyy-mm-dd",
    pickTime: true,
    //startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    //endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
    clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
    //datesDisabled : [],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
    // daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
    daysOfWeekHighlighted: [0], //강조 되어야 하는 요일 설정
    disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
    immediateUpdates: true, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
    //multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
    //multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
    templates: {
      leftArrow: "&laquo;",
      rightArrow: "&raquo;",
    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
    showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
    // title: "", //캘린더 상단에 보여주는 타이틀
    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
    //toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
    weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
    language: "kr", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
  });

  // 시작일 당일부터
  // $("#next_reserve_dt").datepicker("setStartDate", "0d");
  $(".multidate").datepicker({
    format: "yyyy-mm-dd",
    multidate: true,
    autoclose: false, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
    keyboardNavigation: false,
    forceParse: false,
    clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
    language: "kr", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
  });
  $("#data_range .input-daterange").datepicker({
    format: "yyyy-mm-dd",
    autoclose: false, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
    keyboardNavigation: false,
    forceParse: false,
    autoclose: true,
    language: "kr", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
  });

  // 셀렉박스 선택후 calss
  $("select").on("change", function () {
    var selectedValue = $(this).val();
    if (selectedValue) {
      $(this).addClass("border-dark");
    } else {
      $(this).removeClass("border-dark");
    }
  });

  $(".date").inputmask({
    mask: "9999-99-99",
  });
  $(".date2").inputmask({
    mask: "9999-99-99",
  });
  $(".hour").inputmask({
    mask: "99:99:99",
  });
  $(".dateHour").inputmask({
    mask: "99/99/9999 99:99:99",
  });
  $(".mob_no").inputmask({
    mask: "999-9999-9999",
  });

  $(".phone").inputmask({
    mask: "999-9999-9999",
  });

  $(".telphone_with_code").inputmask({
    mask: "(99) 9999-9999",
  });

  $(".us_telephone").inputmask({
    mask: "(999) 999-9999",
  });

  $(".ip").inputmask({
    mask: "999.999.999.999",
  });

  $(".ipv4").inputmask({
    mask: "999.999.999.9999",
  });

  $(".ipv6").inputmask({
    mask: "9999:9999:9999:9:999:9999:9999:9999",
  });

  $(".business_no").inputmask({
    mask: "999-99-99999",
  });
  $(".autonumber").autoNumeric("init");

  //2022-10-20
  $("[data-toggle='KeyUpNext']").on("keyup", function (e) {
    var val = $(this).val();
    var max = $(this).data("max");
    var next = $(this).data("next");
    if (max > 0 && next) {
      if (val.length == max) {
        $(next).focus();
      }
    }
  });

  //
  $("#reserver_color, #user_color, .colordemo").spectrum({
    locale: "ko",
    type: "component",
    showAlpha: false,
  });

  // 고정틀 기능 : 이름,환자명 화면 좌측 고정용 (im.js)
  stickyTableRow();
});

function toggleFullScreen() {
  var a = $(window).height() - 10;

  if (
    !document.fullscreenElement && // alternative standard method
    !document.mozFullScreenElement &&
    !document.webkitFullscreenElement
  ) {
    // current working methods
    if (document.documentElement.requestFullscreen) {
      document.documentElement.requestFullscreen();
    } else if (document.documentElement.mozRequestFullScreen) {
      document.documentElement.mozRequestFullScreen();
    } else if (document.documentElement.webkitRequestFullscreen) {
      document.documentElement.webkitRequestFullscreen(
        Element.ALLOW_KEYBOARD_INPUT
      );
    }
  } else {
    if (document.cancelFullScreen) {
      document.cancelFullScreen();
    } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if (document.webkitCancelFullScreen) {
      document.webkitCancelFullScreen();
    }
  }
}
// notify 버튼옵션
GrowlNotification.setGlobalOptions({
  buttons: {
    action: {
      text: "확인",
    },
    cancel: {
      text: "닫기",
    },
  },
});

function getOptions() {
  var position = "top-right"; //top-center,bottom-center
  var closeTimeout = 0; // 1000,2000,3000...
  var animation = "none"; // none,slide,fade
  var showButtons = true; // true,false
  var showProgressBar = false; // true,false
  var animationOptions = {
    open: animation + "-in",
    close: animation + "-out",
  };

  if (animation === "none") {
    animationOptions = {
      open: false,
      close: false,
    };
  }

  return (options = {
    title: "고지",
    description: "고지 내역이 없습니다.",
    position: position,
    closeTimeout: closeTimeout,
    closeWith: ["click"],
    animation: animationOptions,
    showButtons: showButtons,
    buttons: {
      action: {
        callback: function (notification) {
          console.log("action button");
        },
      },
    },
    showProgress: showProgressBar,
  });
}

function im_notification(set_options) {
  var options = getOptions();
  set_options &&
    $.each(set_options, function (index, value) {
      options[index] = value;
    });
  console.log("fn:im_notification");
  console.log(options);
  // GrowlNotification.notify(options);
}

//페이지 노출수 변경
function fnListCount(count) {

  if (count > 0) {
    $("#searchform input#list_block").val(count);
    fnSearch();
  }
  console.log(arguments.callee.name + ":count 값이 정확하지 않습니다.");
  return false;
}
