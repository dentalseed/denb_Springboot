;(function ($) {
    $.dump = function(obj, name) {
        var indent = "  ";
        if (typeof obj == "object") {
            var child = null;
            var output = (name) ? indent + name + "\n" : "";
            indent += "\t";

            for (var item in obj)
            {
                try {
                    child = obj[item];
                } catch (e) {
                    child = "<Unable to Evaluate>";
                }

                if (typeof child == "object") {
                    output += $.dump(child, item);
                } else {
                    output += indent + item + ": " + child + "\n";
                }
            }

            return output;

        } else {
            return obj;
        }
    };

    $.mdf = $.mdf || {};
    $.extend($.mdf, {
        // /////////////////////////////////////////////////////////////////////////////
        // 공통 유틸리티
        /**
         * 배열을 Object로 변환한다.
         *
         * @param array 배열
         * @returns {Object} Object
         */
        arrayToObject : function(array) {
            var obj = {};
            $.each(array, function() {
                var name;
                $.each(this, function(i, value){
                    if (i=="name") {
                        name = value;
                    } else if (i=="value") {
                        obj[name] = value;
                    }
                });
            });
            return obj;
        },
        toggleDisabled : function(selector) {
            var disabled = $(selector).attr("disabled");
            $(selector).attr("disabled", !disabled);
        },

        // /////////////////////////////////////////////////////////////////////////////
        // String 유틸리티
        /**
         * 주어진 문자열의 개행문자(\n)를 <br/>태그로 변환
         *
         * @param str 문자열
         * @returns {String} 개행문자(\n)가 <br/>태그로 변환된 문자열
         */
        replaceNewLineToBr : function(str) {
            return str ? str.replace(/\n/g, "<br/>") : str;
        },
        /**
         * 문자열 라인중 가장 긴 문자열의 길이를 가져온다
         *
         * @param str 문자열
         * @param separator 라인구분자
         * @returns {Number} 가장 긴 문자열의 길이
         */
        maxLineLength : function(str, separator) {
            var maxLineLength = 0;
            if(str) {
                var lineArray = str.split(separator);
                for(var i = 0; i < lineArray.length; i++) {
                    maxLineLength = Math.max(maxLineLength, lineArray[i].length);
                }
            }

            return maxLineLength;
        },
        /**
         * 빈문자열(null, '', 공백)인지 체크
         *
         * @param obj 문자열(jQuery 객체나 String 객체)
         * @returns 빈문자열이면 true, 아니면 false
         */
        isBlank : function(obj) {
            if(obj) {
                if ($.type(obj) === "string") {
                    return /^\s*$/.test(obj);
                } else if (obj instanceof jQuery) {
                    return ($.trim(obj.val()) == "") ? true : false;
                }
            }

            return true;
        },
        /**
         * 빈문자열(null, '', 공백)이 아닌지 체크
         *
         * @param obj 문자열(jQuery 객체나 String 객체)
         * @returns 빈문자열아니면 true, 이면 false
         */
        isNotBlank : function(obj) {
            if(obj) {
                if ($.type(obj) === "string") {
                    return !(/^\s*$/.test(obj));
                } else if (obj instanceof jQuery) {
                    return ($.trim(obj.val()) == "") ? false : true;
                }
            }
            return false;
        },
        startsWith : function(str, prefix) {
            // javascript startsWith() 메소드 IE 미지원 문제를 indexOf 메소드로 해결
            return (str == null || prefix == null) ? false : (str.indexOf(prefix) == 0);
        },
        endsWith  : function(str, suffix) {
            // javascript endsWith() 메소드 IE 미지원 문제를 lastIndexOf 메소드로 해결
            return (str == null || suffix == null) ? false : (str.lastIndexOf(suffix) + suffix.length == str.length);
        },
        defaultIfBlank : function(str, defaultStr) {
            return $.mdf.isBlank(str) ? defaultStr : str;
        },
        countMatches : function(array, value) {
            var count = 0;

            $.each(array, function(i, element) {
                if(element == value) {
                    count++;
                }
            });

            return count;
        },

        // /////////////////////////////////////////////////////////////////////////////
        // Number 유틸리티
        toInt : function(fromValue, defaultValue) {
            var toValue = parseInt(fromValue);
            return isNaN(toValue) ? defaultValue : toValue;
        },
        toFloat : function(fromValue, defaultValue) {
            var toValue = parseFloat(fromValue);
            return isNaN(toValue) ? defaultValue : toValue;
        },

        // /////////////////////////////////////////////////////////////////////////////
        // Date 유틸리티
        /**
         * yyyyMMdd형 또는 yyyyMMddHHmmss형 문자열을 Date 객체로 변환
         *
         * @param yyyyMMdd형 또는 yyyyMMddHHmmss형 문자열
         * @returns {Date} Date 객체
         */
        toDate : function(dateString) {
            var year  = dateString.substr(0,4);
            var month = dateString.substr(4,2) - 1; // 1월=0,12월=11
            var day   = (dateString.length >= 8) ? dateString.substr(6,2) : '01';

            if(dateString.length >= 14) {
                var hour  = dateString.substr(8,2);
                var min   = dateString.substr(10,2);
                var sec   = dateString.substr(12,2);

                return new Date(year, month, day, hour, min, sec);
            }

            return new Date(year, month, day);
        },
        addDays : function(date, amount) {
            var tempDate;

            if(date.constructor == Date) {
                tempDate = date;
            } else if(date.constructor == String) {
                tempDate = this.toDate(date);
            }

            tempDate.setDate(tempDate.getDate() + amount);
            return tempDate;
        },
        addMonths : function(date, amount) {
            var tempDate;

            if(date.constructor == Date) {
                tempDate = date;
            } else if(date.constructor == String) {
                tempDate = this.toDate(date);
            }

            tempDate.setMonth(tempDate.getMonth() + amount);
            return tempDate;
        },
        toFmtDateString : function (date) {
            var dateString;
            if(date.constructor == Date) {
                dateString = this.toDateString(date);
            } else if(date.constructor == String) {
                dateString = date;
            }

            if(dateString) {
                if(dateString.length >= 8) {
                    return dateString.substr(0,4) + "-" + dateString.substr(4,2) + "-" + dateString.substr(6,2);
                } else if(dateString.length >= 6) {
                    return dateString.substr(0,4) + "-" + dateString.substr(4,2);
                }

                return dateString;
            }

            return "";
        },
        toDateString : function(date) {
            var dateString = date.getFullYear() + '';
            var month = date.getMonth() + 1;
            dateString += (month < 10) ? '0' + month: month;
            var day = date.getDate();
            dateString += (day < 10) ? '0' + day : day;

            return dateString;
        },
        toDateTimeString : function(date){
            var dateString = date.getFullYear() + '';
            var month = date.getMonth() + 1;
            dateString += (month < 10) ? '0' + month: month;
            var day = date.getDate();
            dateString += (day < 10) ? '0' + day : day;
            var hours = date.getHours();
            dateString += (hours <10) ? '0' + hours : hours;
            var minutes = date.getMinutes();
            dateString += (minutes <10) ? '0' + minutes : minutes;
            var seconds = date.getSeconds();
            dateString += (seconds <10) ? '0' + seconds : seconds;
            return dateString;
        },
       
  
    });
})(jQuery);