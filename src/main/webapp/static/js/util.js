// Util 객체 생성
function Util() {

}

// 비밀번호 찾기 팝업
Util.prototype.initializePopup = function(target, title) {
    $("#popup_title").html(title)
    $(target).click(function() {
        $("#popupContainer").fadeIn(); // 팝업 보이기
    });

    $(".closePopup").click(function() {
        $("#popupContainer").fadeOut(); // 팝업 닫기
    });

    $("#popupContainer").click(function(event) {
        if ($(event.target).is("#popupContainer")) {
        $("#popupContainer").fadeOut(); // 팝업 외부 클릭시 닫기
        }
    });
};

function contentMaxLength() {
    var elements = $(".noticeContent, .guideContent, .videoContent");

    // 각 요소에 대해 반복합니다.
    for (var i = 0; i < elements.length; i++) {
        var $element = $(elements[i]); // 현재 요소를 jQuery 객체로 변환합니다.
        var maxLength = 70; // 최대 길이
        
        // 요소의 텍스트 내용이 최대 길이를 초과하는지 확인하고 처리합니다.
        if ($element.text().length > maxLength) {
            $element.text($element.text().substring(0, maxLength) + "...");
        }
    }
}

function noticeView() {
    var noticeData = [
        {
            title: "중요!!! 2024년03월11일 13시부터  덴탈비서 3.0버전 메뉴 변경 안내",
            date: "5시간 전",
            content: "안녕하십니까.덴탈비서 3.0버전을 이용중인 고객님들의 편의를 위해 2024년03월11일"
        },
        {
            title: "2024년 3월11일 덴탈비서 기능 업그레이드 안내",
            date: "5시간 전",
            content: "안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능  안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능 설명은안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능 설명은안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능 설명은안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능 설명은안녕하세요. 덴탈비서 업그레이드 된 신규 기능을 안내 해 드리겠습니다. 자세한 기능 설명은"
        },
        {
            title: "2024년 2월07일 덴탈비서 기능 업그레이드 안내",
            date: "1개월 전",
            content: "안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다.   1. 덴탈비서는 접수관리의 편 안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다.   1. 덴탈비서는 접수관리의 편 안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다.1. 덴탈비서는 접수관리의 편 안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다.1. 덴탈비서는 접수관리의 편 안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다.1. 덴탈비서는 접수관리의 편 안녕하세요. 덴탈비서의 신규 기능을 소개해 드리겠습니다."
        },
    ];
    
      // .noticeSet 생성
    for (var i = 0; i < noticeData.length; i++) {
        var noticeSet = $("<div class='noticeSetBox'></div>");
        const title = noticeData[i].title;
        const content = noticeData[i].content;

        // 공지 제목과 일자 추가
        var titleDateBox = $("<div class='notice_title_box'></div>");
        titleDateBox.append(`<a href='' class='open-popup' style='font-size: 14px; font-weight: 900;' data-title='${title}'>${title} </a>`);
        titleDateBox.append("<span style='color: #3fccb8; font-size: 0.625rem; font-weight: 700;'>" + noticeData[i].date + "</span>");

        // 공지 내용 추가
        var contentBox = $("<div class='notice_con_box'></div>");
        contentBox.append(`<span class="noticeContent" style="font-size: 0.8125rem; font-weight: 700;" data-content='${content}'>${content}</span>`);

        // .noticeSet에 추가
        noticeSet.append(titleDateBox);
        noticeSet.append(contentBox);

        // #noticeContainer에 추가
        $("#noticeContainer").append(noticeSet);
    }
};

function guideView() {
    var guideData = [
        {
            title: "덴비광과 메뉴 오픈방법",
            date: "12일전",
            content: ""
        },
        {
            title: "카카오톡 템플릿 등록 가이드",
            date: "12일전",
            content: ""
        },
        {
            title: "덴비 CS공문",
            date: "12일전",
            content: "123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213"
        },
        {
            title: "덴비 CS공문",
            date: "12일전",
            content: "123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213"
        },{
            title: "덴비 CS공문",
            date: "12일전",
            content: "123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213"
        },{
            title: "덴비 CS공문",
            date: "12일전",
            content: "123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213123123213213213213213213213"
        },
    ];
    
      // .guideSet 생성
    for (var i = 0; i < guideData.length; i++) {
        var guideSet = $("<div class='guideSetBox'></div>");
        const title = guideData[i].title;
        const content = guideData[i].content;

        // 공지 제목과 일자 추가
        var titleDateBox = $("<div class='notice_title_box'></div>");
        titleDateBox.append(`<a href='' class='open-popup' style='font-size: 14px; font-weight: 900;' data-title='${title}'>${title} </a>`);
        titleDateBox.append("<span style='color: #3fccb8; font-size: 0.625rem; font-weight: 700;'>" + guideData[i].date + "</span>");

        // 공지 내용 추가
        var contentBox = $("<div class='notice_con_box'></div>");
        contentBox.append(`<span class="noticeContent" style="font-size: 0.8125rem; font-weight: 700;" data-content='${content}'>${content}</span>`);

        // .guideSet에 추가
        guideSet.append(titleDateBox);
        guideSet.append(contentBox);

        // #guideContainer에 추가
        $("#guideContainer").append(guideSet);
    }
    
};

function videoView() {
    var videoData = [
        {
            title: "ARS 덴비 LG ARS 에이전트 설치 가이드",
            date: "12일전",
            content: "덴비 LG ARS 에이전트 설치 가이드설치파일은 첨부파일 확인"
        },
        {
            title: "온라인컨설팅 예약환자 점검하기",
            date: "12일전",
            content: ""
        }
    ];
    
      // .videoSet 생성
    for (var i = 0; i < videoData.length; i++) {
        var videoSet = $("<div class='videoSetBox'></div>");
        const title = videoData[i].title;
        const content = videoData[i].content;

        // 공지 제목과 일자 추가
        var titleDateBox = $("<div class='notice_title_box'></div>");
        titleDateBox.append(`<a href='' class='open-popup' style='font-size: 14px; font-weight: 900;' data-title='${title}'>${title} </a>`);
        titleDateBox.append("<span style='color: #3fccb8; font-size: 0.625rem; font-weight: 700;'>" + videoData[i].date + "</span>");

        // 공지 내용 추가
        var contentBox = $("<div class='notice_con_box'></div>");
        contentBox.append(`<span class="noticeContent" style="font-size: 0.8125rem; font-weight: 700;" data-content='${content}'>${content}</span>`);

        // .videoSet에 추가
        videoSet.append(titleDateBox);
        videoSet.append(contentBox);

        // #videoContainer에 추가
        $("#videoContainer").append(videoSet);
    }
    
};

function truncateText(targetSelector, maxLength) {
    $(targetSelector).each(function() {
        var text = $(this).text(); // 각 요소의 텍스트를 가져옴
        var truncatedText = text.length > maxLength ? text.substring(0, maxLength) + '…' : text;
        $(this).text(truncatedText); // 각 요소에 처리된 텍스트 설정
    });
}

function textareaAuto(target) {
    $(target).on('input', function() {
        $(this).css('height', 'auto'); // 높이 초기화
        $(this).css('height', this.scrollHeight + 'px'); // 스크롤 높이로 설정
    });
    console.log(target)
}

function dialogPopup() {
    $(".open-popup").click(function(event) {
        // 기본 동작 방지
        event.preventDefault();

        // 랜덤 숫자 생성 함수 
        const getRandomNumber = () => {
            return Math.floor(Math.random() * 10) + 1; 
        }

        var thisBox = $(this);
        let titleBox = thisBox.data('title');
        let contentBox = thisBox.parent('.notice_title_box').siblings('.notice_con_box').children('.noticeContent').data('content');
        const data = {
            title: "빠른메모",
            contentTitle: titleBox,
            date: "2024-03-11 10:21:58",
            commentCount: getRandomNumber(),
            viewCount: getRandomNumber(),
            writer: "작성자:관리자",
            content: contentBox
        };

        // 팝업 내용 설정
        $(".popup_top_title").html(data.title);
        $(".popup_content_title").html(data.contentTitle);
        $(".popup_date").html(data.date);
        $(".commentCount").html(data.commentCount);
        $(".viewCount").html(data.viewCount);
        $(".writer").html(data.writer);
        $(".popupContents").html(data.content);

        // 팝업 활성화
        $(".popup-container").addClass("active");
    });

    $(".close-popup, .popup-background").click(function() {
        $(".popup-container").removeClass("active");
    });
}


$(document).ready(function(){
    $('.tooltip_top').tooltip({
        placement: 'top'
    });

    $('.tooltip_right').tooltip({
        placement: 'right'
    });

    $("#arsMonitoring").click(()=>{
        window.open("https://denb.co.kr/monitoring/ars_monitoring.php");
    });

    truncateText(".lengthLimit", 20);
    textareaAuto(".kakaoContents");

    noticeView();
    guideView();
    videoView();
    contentMaxLength();
    dialogPopup();
});