const loginModule = (function() {
    // Ajax 요청을 보내는 함수
    function loginRequest(url, type, data, successCallback, errorCallback) {
        $.ajax({
            url: url,
            type: type,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: successCallback,
            error: errorCallback
        });
    }

    // 공개 API
    return {
        loginRequest: loginRequest
    };
})();

const registerModule = (function() {
    // Ajax 요청을 보내는 함수
    function registerRequest(url, type, data, successCallback, errorCallback) {
        $.ajax({
            url: url,
            type: type,
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: successCallback,
            error: errorCallback
        });
    }

    // 공개 API
    return {
        registerRequest: registerRequest
    };
})();

$(document).ready(function(){
    $(document).keypress(function(event) {
        if (event.which === 13) { // Enter 키의 keyCode는 13입니다.
            event.preventDefault(); // 기본 동작(페이지 새로고침) 방지
            $("#loginBtn").click(); // 로그인 함수 호출
        }
    });

    // 약관 동의여부 체크
    function termsCheck() {
        var allChecked = true;
        $('input[name="sms_yn"]').not(':eq(2)').each(function() {
            if (!$(this).is(':checked')) {
                allChecked = false;
                return false;
            }
        });
        return allChecked;
    }

    // 비밀번호 일치 체크
    function checkPasswordMatch() {
        var password = $("#reg_mb_password").val();
        var confirmPassword = $("#reg_mb_password_re").val();

        // 비밀번호가 일치하는지 확인하고 결과에 따라 콜백 함수 실행
        if (password === confirmPassword) {
            $(".passCheck").css("color", "green"); // 일치할 경우 초록색으로 변경
        } else {
            $(".passCheck").css("color", "#DDD");
        }
    }

    // 휴대폰번호 입력 하이픈 생성
    function telHyphen(target) {
        $(target).on('input', function() {
            var phoneNumber = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 남기고 다른 문자는 제거
            var formattedNumber = '';

            // 휴대폰 번호에 하이픈 추가
            if (phoneNumber.length >= 3) {
                formattedNumber += phoneNumber.substring(0, 3);
                if (phoneNumber.length >= 7) {
                    formattedNumber += '-' + phoneNumber.substring(3, 7);
                    if (phoneNumber.length >= 11) {
                        formattedNumber += '-' + phoneNumber.substring(7, 11);
                    } else {
                        formattedNumber += '-' + phoneNumber.substring(7);
                    }
                } else {
                    formattedNumber += '-' + phoneNumber.substring(3);
                }
            } else {
                formattedNumber = phoneNumber;
            }

            $(this).val(formattedNumber);
        });
        // 백스페이스 키 입력 시 하이픈 삭제
        $('#reg_mb_hp').on('keydown', function(event) {
            if (event.keyCode === 8) { // 백스페이스 키
                var currentValue = $(this).val();
                if (currentValue.length > 0 && currentValue[currentValue.length - 1] === '-') {
                    // 입력된 값의 마지막 문자가 하이픈인 경우 하이픈 제거
                    $(this).val(currentValue.slice(0, -1));
                }
            }
        });
    }

    // 휴대폰인증 카운트 생성
    function smsCount() {
        var count = 60; // 초기 카운트 값 설정
        var countdownTimer = setInterval(function() {
            // 카운트 값을 #smskey에 출력
            $('#smskey_str').text("인증번호확인 ");
            $('#time').text(count);

            // 카운트가 0이 되면 타이머 종료
            if (count === 0) {
                clearInterval(countdownTimer);
                $('#smskey_str').text("인증번호 재발송");
                $('#time').text("");
            } else {
                count--; // 카운트 값을 감소시킴
            }
        }, 1000); // 1초마다 카운트 값을 갱신
    }

    // 회원가입 input box 체크
    function validateInputs(onSuccessCallback) {
        var idInput         = $("#userId").val();
        var passwordInput   = $("#reg_mb_password").val();
        var passwordInputRe = $("#reg_mb_password_re").val();
        var nameInput       = $("#reg_mb_name").val();
        var telInput        = $("#reg_mb_hp").val();

        if(idInput === "") {
            alert("아이디를 입력해주세요");
            return false;
        } else if(!/^[a-zA-Z0-9]+$/.test(idInput)){
            alert("아이디를 영문자와 숫자로 입력해주세요.");
            return false;
        } else if(passwordInput === "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        } else if(passwordInput !== passwordInputRe) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        } else if(nameInput === "") {
            alert("이름을 입력해주세요.");
            return false;
        } else if(telInput === "") {
            alert("핸드폰번호를 입력해주세요.");
            return false;
        } else if(!/^(010|011|016|017|018|019)-\d{3,4}-\d{4}$/.test(telInput)){
            alert("올바르지 않은 휴대폰 번호입니다.");
            return false;
        } else {
            onSuccessCallback();
            return true;
        }
    }

    // 로그인 / 메인 페이지에서 작동
    if (window.location.href.includes("/login.do") || window.location.href.includes("/")) {
        $("#loginBtn").click(() => {
            var userIdValue = $('#userId').val();
            var userPwdValue = $('#userPwd').val();

            const apiUrl = '/login.do';
            const requestData = {
                memberId : userIdValue,
                memberPw : userPwdValue,
            };

            loginModule.loginRequest(apiUrl, 'POST', requestData,
                function(json) {
                    if (json.data === "redirect:/admin") {
                        location.href = "/admin";
                    } else {
                        location.href = "/";
                    }

                    // console.log('요청이 성공했습니다.');
                },
                function(xhr, status, error) {
                    alert("아이디와 비밀번호를 확인해주세요.")
                    // console.error('요청이 실패했습니다.');
                    // console.error(status);
                    // console.error(error);
                    // console.error(xhr);
                }
            );
        });
    }

    // 회원가입 페이지에서 작동
    if (window.location.href.includes("/register.do")) {
        $("#reg_mb_password, #reg_mb_password_re").on("input", function() {
            checkPasswordMatch();
        });
        telHyphen('#reg_mb_hp');

        $("#smskey").click(()=>{
            validateInputs(function(){
                $("#reg_sms").prop('disabled', false);
                alert("인증번호를 발송하였습니다. 60초내에 입력해주세요.");
                smsCount();
            });
        });

        $("#btn_submit").click(()=>{
            validateInputs(function(){
                var isChecked = termsCheck();
                var telInput  = $("#reg_sms").val();
                var athntNmbr = "1234";
                console.log(reg_sms);
                if (isChecked === false) {
                    alert("약관에 동의해주세요.");
                } else if(telInput === athntNmbr) {
                    alert("회원가입 완료");
                } else {
                    alert("올바른 인증번호를 입력해주세요.");
                }

                //회원가입 정보
                const memberId = $("#userId").val();
                const memberPw = $("#reg_mb_password").val();
                const checkPw = $("#reg_mb_password_re").val();
                const memberName= $("#reg_mb_name").val();
                const phoneNumber= $("#reg_mb_hp").val();

                //요청 주소
                const url = '/register.do'

                // 요청 데이터 json 변환
                const requestData = {
                    memberId : memberId,
                    memberPw : memberPw,
                    checkPw : checkPw,
                    memberName : memberName,
                    phoneNumber : phoneNumber,
                }

                // 회원가입 요청
                registerModule.registerRequest(url, 'POST', requestData,
                    function (json) {
                        const resultInfo = json.data.member;
                        // 메인 페이지로 이동
                        location.href = "/"
                    },
                    function (request, status, error) {
                        alert(request.responseText);
                    });
            });
        });
    };

    $(".sec_top_menu").click(function(){
        $(".sec_top_menu").removeClass("sec_top_menu_active");
        $(this).addClass("sec_top_menu_active");
    });
});