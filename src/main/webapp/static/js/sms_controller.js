// 날짜 버튼 클릭 함수
function dateInputSet(startId, endId, type) {
    // input 요소 가져오기
    var startDateInput = document.getElementById(startId);
    var endDateInput = document.getElementById(endId);
    var today = new Date();
    var yyyy = today.getFullYear();
    var mm = today.getMonth() + 1;
    var dd = today.getDate();

    // 저번달 1일 설정
    var startDate = new Date(yyyy, mm - 1, 1);

    // 이번달 1일 설정
    var endDate = new Date(yyyy, mm - 1, dd);

    // 주어진 조건에 따라 시작일 설정
    if (type === 'recentWeek') {
        startDate = new Date(today);
        startDate.setDate(startDate.getDate() - 7);
    } else if (type === 'lastWeek') {
        startDate = new Date(today);
        startDate.setDate(startDate.getDate() - 14); // 저번주이므로 7일을 추가로 빼줌
        endDate.setDate(endDate.getDate() - 7); // 종료일도 조정
    } else if (type === 'recentMonth') {
        startDate = new Date(yyyy, mm - 2, dd); // 현재 월에서 한달을 뺌
    } else if (type === 'lastMonth') {
        startDate = new Date(yyyy, mm - 2, 1); // 저번달의 시작일로 설정
        endDate.setDate(0); // 저번달의 마지막 날로 설정
    } else if (type === 'recent3Months') {
        startDate = new Date(yyyy, mm - 4, dd); // 현재 월에서 세달을 뺌
    } else if (type === 'recent6Months') {
        startDate = new Date(yyyy, mm - 7, dd); // 현재 월에서 여섯달을 뺌
    } else if (type === 'lastYear') {
        startDate = new Date(yyyy - 1, 0, 1);
        endDate   = new Date(yyyy - 1, 11, 31);
    } else if (type === '2YearsAgo') {
        startDate = new Date(yyyy - 2, 0, 1);
        endDate   = new Date(yyyy - 2, 11, 31);
    } else if (type === '3YearsAgo') {
        startDate = new Date(yyyy - 3, 0, 1);
        endDate   = new Date(yyyy - 3, 11, 31);
    }

    // 시작일이 정의되지 않았을 경우 종료
    if (!startDate) {
        console.error('Invalid date type');
        return;
    }

    // 시작일과 종료일을 문자열로 변환하여 입력
    var startDateString = startDate.getFullYear() + '-' + String(startDate.getMonth() + 1).padStart(2, '0') + '-' + String(startDate.getDate()).padStart(2, '0');
    var endDateString = endDate.getFullYear() + '-' + String(endDate.getMonth() + 1).padStart(2, '0') + '-' + String(endDate.getDate()).padStart(2, '0');

    startDateInput.value = startDateString;
    endDateInput.value = endDateString;

    $.datepicker.setDefaults({
        closeText: "닫기",
        currentText: "오늘",
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeader: "주",
        yearSuffix: '년'
    });

    $("#search_start_dt, #search_end_dt").datepicker({
        dateFormat: 'yy-mm-dd', // datepicker의 날짜 형식 설정
        onSelect: function(dateText) {
            // 선택된 날짜를 "yyyy-MM-dd" 형식으로 변환
            var selectedDate = $.datepicker.formatDate("yy-mm-dd", new Date(dateText));
            $(this).val(selectedDate); // 변환된 날짜를 input 상자에 설정
        }
    });
}

//숫자를 한글로 환산하는 함수
function convertToKorean(amount) {
    let tmpAmt = "";

    if (amount === 0 || amount === "0") return "";

    amount = "000000000000" + amount.toString().replace(",", "");
    let j = 0;

    for (let i = amount.length; i > 0; i--) {
        j++;
        const digit = amount.substring(i - 1, i);

        if (digit !== "0") {
            if (j % 4 === 2) tmpAmt = "십" + tmpAmt;
            if (j % 4 === 3) tmpAmt = "백" + tmpAmt;
            if (j > 1 && j % 4 === 0) tmpAmt = "천" + tmpAmt;
        }

        const section = amount.substring(amount.length - 8, amount.length - 4);

        if (j === 5 && parseInt(section) > 0) tmpAmt = "만" + tmpAmt;

        const billionSection = amount.substring(amount.length - 12, amount.length - 8);
        if (j === 9 && parseInt(billionSection) > 0) tmpAmt = "억" + tmpAmt;

        const trillionSection = amount.substring(amount.length - 16, amount.length - 12);
        if (j === 13 && parseInt(trillionSection) > 0) tmpAmt = "조" + tmpAmt;

        if (digit === "1") tmpAmt = "일" + tmpAmt;
        if (digit === "2") tmpAmt = "이" + tmpAmt;
        if (digit === "3") tmpAmt = "삼" + tmpAmt;
        if (digit === "4") tmpAmt = "사" + tmpAmt;
        if (digit === "5") tmpAmt = "오" + tmpAmt;
        if (digit === "6") tmpAmt = "육" + tmpAmt;
        if (digit === "7") tmpAmt = "칠" + tmpAmt;
        if (digit === "8") tmpAmt = "팔" + tmpAmt;
        if (digit === "9") tmpAmt = "구" + tmpAmt;
    }

    return tmpAmt;
}

// 숫자만 추출하는 함수
function resultCashPrice(select) {
    // 숫자를 추출할 문자열
    const originalString = "abc123def456gh789,";
    // 정규 표현식을 사용하여 숫자만 추출
    const numbersOnly = select.parents(".m-2").find(".cash_price").html().match(/\d+/g).join('');

    return parseInt(numbersOnly, 10);
}

// 숫자 3자리마다 콤마(,)
function formatNumber(tagetInput) {
    $(tagetInput).on('keyup', function(e) {
        let value = $(this).val();
        value = Number(value.replaceAll(',', ''));
        if (isNaN(value)) {
            $(this).val(0);
        } else {
            const formatValue = value.toLocaleString('ko-KR');
            $(this).val(formatValue);
        }
    });
}

// 전송내역 날짜버튼 클릭시 작동
function dateClickEvent() {
    $(".dateBtn").click(function(){
        var dateSelect = $(this).data('value');
        dateInputSet("search_start_dt", "search_end_dt", dateSelect);
    });

    $(".searchSubject").click(function(){
        var checkIcon = '<i class="fa fa-check" style="margin-right: 2px;"></i>';

        $(".searchSubject").removeClass("searchSubject_active");
        $(".searchSubject .fa-check").remove();
        $(this).addClass("searchSubject_active");
        $(this).prepend(checkIcon);
    });

    $("#search_type").change(function(){
        console.log($(this).val());
        if($(this).val() === "일별") {
            $("#search_start_dt, .middle_icon").hide();
        } else if($(this).val() === "기간별") {
            $("#search_start_dt, .middle_icon").show();
        }
    })
}

// 3자리마다 콤마
function addComma(num) {
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ',');
}

// cash 충전 하기
function chageCashEvent() {
    var resultPrice = 0;
	
	$('.dropBtn').click(function () {
		var thisCashNumber = $(this).parents(".qnttyBox").children(".cashNumber");
		if (thisCashNumber.val() > 0) {
			thisCashNumber.val(parseInt(thisCashNumber.val(), 10) - 1);
	
			var individualResult = resultCashPrice($(this));
			resultPrice -= individualResult; // 클릭할 때마다 현재 값을 제외
			console.log(resultPrice);

			$(".chargeCashVal, .totalAmountPayment").html(addComma(resultPrice))
			// $("#buyReqamt").val(resultPrice);
			$(".totalAmountPaymentKor").html(convertToKorean(resultPrice));
			console.log(convertToKorean(resultPrice))
		}
	});
	
	$('.addBtn').click(function () {
		var thisCashNumber = $(this).parents(".qnttyBox").children(".cashNumber");
		if (thisCashNumber.val() < parseInt(thisCashNumber.attr('max'), 10)) {
			thisCashNumber.val(parseInt(thisCashNumber.val(), 10) + 1);
	
			// var individualResult = resultCashPrice($(this)) * parseInt(thisCashNumber.val(), 10);
			var individualResult = resultCashPrice($(this));
			resultPrice += individualResult; // 클릭할 때마다 현재 값을 더함
			console.log(resultPrice);

			$(".chargeCashVal, .totalAmountPayment").html(addComma(resultPrice))
			// $("#buyReqamt").val(resultPrice);
			$(".totalAmountPaymentKor").html(convertToKorean(resultPrice));
		}
	});

	$(".resetBtn").click(function(){
		location.reload();
	});
	$("#fixedNumber").click(function(){
		$(".chargeCashVal, .totalAmountPayment").html($("#rdo_val_manual").val());
		// $("#buyReqamt").val($("#rdo_val_manual").val().replace(/^0+|[^\d]/g, ""));  //쉼표 제거 후 값 변경
		$(".totalAmountPaymentKor").html(convertToKorean($("#rdo_val_manual").val().replace(/^0+|[^\d]/g, "")));
	});
}

$(document).ready(function(){
    if (['sms_history_list', 'solution_list_adm', 'df_data_list_new', 'df_data_statistic', 'product_order_list', 'deposit_sms_history', 'deposit_sms_history_details', 'deposit_sms_sending_list', 'deposit_sms_replace_list', 'kakao_user_kakao_list_day', 'kakao_user_kakao_list_detaile', 'kakao_user_kakao_list_template'].some(path => window.location.href.includes(path))) {
        dateInputSet("search_start_dt", "search_end_dt");
        dateClickEvent();
    }

    // 캐쉬충전하기
    formatNumber("#userSumInput");
    chageCashEvent();
})