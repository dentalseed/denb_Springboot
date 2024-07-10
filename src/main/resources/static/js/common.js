// 필드 검사
function trim(s) {
    var t = "";
    var from_pos = to_pos = 0;

    for (i = 0; i < s.length; i++) {
        if (s.charAt(i) == ' ')
            continue;
        else {
            from_pos = i;
            break;
        }
    }

    for (i = s.length; i >= 0; i--) {
        if (s.charAt(i - 1) == ' ')
            continue;
        else {
            to_pos = i;
            break;
        }
    }

    t = s.substring(from_pos, to_pos);
    return t;
}

// 자바스크립트로 PHP의 number_format 흉내를 냄
// 숫자에 , 를 출력
function numberFormat(number, decimals, decSeparator, thousandsSeparator) {
    decimals = decimals || 0;
    decSeparator = decSeparator || '.';
    thousandsSeparator = thousandsSeparator || ',';

    number = parseFloat(number.toFixed(decimals)).toString();

    var parts = number.split('.');
    var integerPart = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, thousandsSeparator);
    var decimalPart = parts.length > 1 ? decSeparator + parts[1] : '';

    return integerPart + decimalPart;
}

// , 를 없앤다.
function no_comma(data) {
    var tmp = '';
    var comma = ',';
    var i;

    for (i = 0; i < data.length; i++) {
        if (data.charAt(i) != comma)
            tmp += data.charAt(i);
    }
    return tmp;
}

// set_storage() 함수는 storage를 생성합니다.
function set_storage(storage_name, obj) {
    if (typeof storage_name !== 'string') {
        console.error('storage_name은 문자열이어야 합니다.');
        return false;
    }
    if (typeof obj !== 'object') {
        console.error('storage는 객체여야 합니다.');
        return false;
    }
    localStorage.setItem(storage_name, JSON.stringify(obj));
    // console.log('storage가 ' + storage_name + '으로 설정되었습니다:', obj);
    return true;
}

// get_storage() 함수는 저장된 storage를 가져옵니다.
function get_storage(storage_name) {
    const storage = localStorage.getItem(storage_name);
    if (storage === null) {
        // console.log(storage_name + '에 저장된 storage가 없습니다.');
        return null;
    }

    const storeOption = JSON.parse(storage);
    // console.log('storage를 가져왔습니다:', storeOption);
    return storeOption;
}

// 쿠키 입력
function set_cookie(name, value, expirehours, domain) {
    var today = new Date();
    today.setTime(today.getTime() + (60 * 60 * 1000 * expirehours));
    document.cookie = name + "=" + encodeURI(value) + "; path=/; expires=" + today.toGMTString() + ";";
    if (domain) {
        document.cookie += "domain=" + domain + ";";
    }
}

// 쿠키 입력
function fn_set_cookie(name, value, expirehours, domain) {
    var today = new Date();
    today.setTime(today.getTime() + (60 * 60 * 1000 * expirehours));
    document.cookie = name + "=" + encodeURI(value) + "; path=/; expires=" + today.toGMTString() + ";";
    if (domain) {
        document.cookie += "domain=" + domain + ";";
    }
}

// 쿠키 얻음
function get_cookie(name) {
    var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
    if (match) return decodeURI(match[2]);
    return "";
}

// 쿠키 얻음
function fn_get_cookie(name) {
    var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
    if (match) return decodeURI(match[2]);
    return "";
}


// 쿠키 지움
function delete_cookie(name) {
    var today = new Date();
    today.setTime(today.getTime() - 1);
    var value = get_cookie(name);
    if (value != "")
        document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
}

// 쿠키 지움
function fn_delete_cookie(name) {
    var today = new Date();
    today.setTime(today.getTime() - 1);
    var value = get_cookie(name);
    if (value != "")
        document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
}

// 글숫자 검사
function check_byte(content, target) {
    var i = 0;
    var cnt = 0;
    var ch = '';
    var cont = document.getElementById(content).value;

    for (i = 0; i < cont.length; i++) {
        ch = cont.charAt(i);
        if (escape(ch).length > 4) {
            cnt += 2;
        } else {
            cnt += 1;
        }
    }
    // 숫자를 출력
    document.getElementById(target).innerHTML = cnt;
    return cnt;
}

function encodeURL(str) {
    var s0, i, s, u;
    s0 = "";                // encoded str
    for (i = 0; i < str.length; i++) {   // scan the source
        s = str.charAt(i);
        u = str.charCodeAt(i);          // get unicode of the char
        if (s == " ") { s0 += "+"; }       // SP should be converted to "+"
        else {
            if (u == 0x2a || u == 0x2d || u == 0x2e || u == 0x5f || ((u >= 0x30) && (u <= 0x39)) || ((u >= 0x41) && (u <= 0x5a)) || ((u >= 0x61) && (u <= 0x7a))) {       // check for escape
                s0 = s0 + s;            // don't escape
            }
            else {                  // escape
                if ((u >= 0x0) && (u <= 0x7f)) {     // single byte format
                    s = "0" + u.toString(16);
                    s0 += "%" + s.substr(s.length - 2);
                }
                else if (u > 0x1fffff) {     // quaternary byte format (extended)
                    s0 += "%" + (oxf0 + ((u & 0x1c0000) >> 18)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0x3f000) >> 12)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
                else if (u > 0x7ff) {        // triple byte format
                    s0 += "%" + (0xe0 + ((u & 0xf000) >> 12)).toString(16);
                    s0 += "%" + (0x80 + ((u & 0xfc0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
                else {                      // double byte format
                    s0 += "%" + (0xc0 + ((u & 0x7c0) >> 6)).toString(16);
                    s0 += "%" + (0x80 + (u & 0x3f)).toString(16);
                }
            }
        }
    }
    return s0;
}

function decodeURL(str) {
    var s0, i, j, s, ss, u, n, f;
    s0 = "";                // decoded str
    for (i = 0; i < str.length; i++) {   // scan the source str
        s = str.charAt(i);
        if (s == "+") { s0 += " "; }       // "+" should be changed to SP
        else {
            if (s != "%") { s0 += s; }     // add an unescaped char
            else {               // escape sequence decoding
                u = 0;          // unicode of the character
                f = 1;          // escape flag, zero means end of this sequence
                while (true) {
                    ss = "";        // local str to parse as int
                    for (j = 0; j < 2; j++) {  // get two maximum hex characters for parse
                        sss = str.charAt(++i);
                        if (((sss >= "0") && (sss <= "9")) || ((sss >= "a") && (sss <= "f")) || ((sss >= "A") && (sss <= "F"))) {
                            ss += sss;      // if hex, add the hex character
                        } else { --i; break; }    // not a hex char., exit the loop
                    }
                    n = parseInt(ss, 16);           // parse the hex str as byte
                    if (n <= 0x7f) { u = n; f = 1; }   // single byte format
                    if ((n >= 0xc0) && (n <= 0xdf)) { u = n & 0x1f; f = 2; }   // double byte format
                    if ((n >= 0xe0) && (n <= 0xef)) { u = n & 0x0f; f = 3; }   // triple byte format
                    if ((n >= 0xf0) && (n <= 0xf7)) { u = n & 0x07; f = 4; }   // quaternary byte format (extended)
                    if ((n >= 0x80) && (n <= 0xbf)) { u = (u << 6) + (n & 0x3f); --f; }         // not a first, shift and add 6 lower bits
                    if (f <= 1) { break; }         // end of the utf byte sequence
                    if (str.charAt(i + 1) == "%") { i++; }                   // test for the next shift byte
                    else { break; }                   // abnormal, format error
                }
                s0 += String.fromCharCode(u);           // add the escaped character
            }
        }
    }

    return s0;
}

/**
 * @description: 숫자에 쉼표를 추가하는 함수
 * @param {string} 10000
 * @return {100,000}
 */
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function fnValidateCheck(frm) {
    var f = eval(frm);
    var $f = jQuery(f);
    var $b = jQuery(this);
    var $t, t;
    var result = true;

    $f.find("input, select, textarea").each(function (i) {
        $t = jQuery(this);
        if ($t.prop("required")) {
            if (!jQuery.trim($t.val())) {
                t = jQuery("label[for='" + $t.attr("id") + "']").text();
                result = false;
                $t.focus();
                alert($t.attr('title') + "은(는) 필수 입력입니다.");
                return false;
            }
        }
    });
    return result;
}

/**
 * @description:  파일유무 판단
 * @param {*} url 파일경로
 * @return {*} bool
 */
function fileExists(url) {
    var isExists;
    $.ajax({
        url: url,
        async: false,
        type: 'HEAD',
        error: function () {
            isExists = 0;
        },
        success: function () {
            isExists = 1;
        }
    });
    if (isExists == 1) {
        return true;
    } else {
        return false;
    }
}

/*********************************************************************************************************** */
// 화면로딩 마스킹
function fnLoading(title, text) {
    title = title ? title : "데이터 로딩중..";
    text = text ? text : "조회 기간에 따라 로딩시간이 길어질수 있습니다.";
    swal({
        title: title,
        text: text,
        type: "",
        animation: false,
        timer: 60000, // 자동아웃
        showConfirmButton: false,
        showCancelButton: false
    });
};

