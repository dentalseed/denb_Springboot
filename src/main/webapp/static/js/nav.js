$(document).ready(function(){
    // side_nav 생성
    var side_nav_func = function() {
        var navItems = [
            {
                icon: "fa-home",
                title: "HOME",
                submenu: [""]
            },
            {
                icon: "fa-gears",
                title: "덴비 환경설정",
                submenu: [
                    { title: "메뉴 설정", sublink: "denb_menu_list" },
                    { title: "공통코드", sublink: "code_group_list" },
                    { title: "솔루션 버전관리", sublink: "dentist_group_list" },
                    { title: "고객센터", sublink: "customer_center" }
                ]
            },
            {
                icon: "fa-users",
                title: "업체/회원관리",
                submenu: [
                    { title: "사용업체관리", sublink: "dentist_list" },
                    { title: "회원관리", sublink: "user_list" }
                ]
            },
            {
                icon: "fa-list",
                title: "게시판 관리",
                submenu: [
                    { title: "게시판 관리", sublink: "group_list" }
                ]
            },
            {
                icon: "fa-stethoscope",
                title: "치과환경설정",
                submenu: [
                    { title: "진료공통옵션 설정", sublink: "commission_matching_list" },
                    { title: "진료행위 관리", sublink: "commission_incentive_list" },
                    { title: "누락항목 설정[개발]", sublink: "#" }
                ]
            },
            {
                icon: "fa-shopping-cart",
                title: "스토어",
                submenu: [
                    { title: "상품관리", sublink: "product_list" },
                    { title: "분류설정", sublink: "product_category_settings" },
                    { title: "주문현황", sublink: "product_order_list" },
                    { title: "스토어 고객관리", sublink: "product_order_customer" },
                ]
            },
            {
                icon: "fa-credit-card",
                title: "솔루션",
                submenu: [
                    { title: "솔루션 상품관리", sublink: "solution_product" },
                    { title: "솔루션 주문현황", sublink: "solution_list_adm" }
                ]
            },
            {
                icon: "fa-edit",
                title: "덴비폼",
                submenu: [
                    { title: "설문지", sublink: "df_group_list" },
                    { title: "설문참여 내역", sublink: "df_data_list_new" },
                    { title: "설문통계", sublink: "df_data_statistic" }
                ]
            },
            {
                icon: "fa-envelope",
                title: "SMS관리",
                submenu: [
                    { title: "치과별 캐시단가", sublink: "deposit_sms_list" },
                    { title: "결제 내역", sublink: "deposit_sms_history" },
                    { title: "결제 상세내역", sublink: "deposit_sms_history_details" },
                    { title: "문자 전송내역", sublink: "deposit_sms_sending_list" },
                    { title: "문자 치환관리", sublink: "deposit_sms_replace_list" },
                    { title: "문자 템플릿 관리", sublink: "deposit_sms_template_list" },
                    { title: "수신거부 관리", sublink: "deposit_sms_send_fail" },
                ]
            },
            {
                icon: "fa-comment",
                title: "카카오관리",
                submenu: [
                    { title: "템플릿 관리", sublink: "kakao_template" },
                    { title: "발신번호 관리", sublink: "kakao_callback_list" },
                    { title: "발송 상세리스트", sublink: "kakao_send_history_detaile" },
                    { title: "카카오 발송리스트", sublink: "kakao_user_kakao_list_day" },
                    { title: "발신번호관리(관리자)", sublink: "kakao_send_callback_list_admin" },
                    { title: "비지니스 채널관리", sublink: "kakao_send_profile_manage_list_admin" }
                ]
            },
            {
                icon: "fa-bullhorn",
                title: "뉴스/공지/가이드",
                submenu: [
                    { title: "덴비 뉴스", sublink: "notice_news_list" },
                    { title: "덴비공지", sublink: "notice_list" },
                    { title: "덴비 동영상 가이드", sublink: "notice_video_guide_list" },
                    { title: "덴비 이벤트", sublink: "notice_event_list" },
                    { title: "덴비 고객후기", sublink: "notice_customer_review" },
                    { title: "덴비 포트폴리오", sublink: "notice_portfolio_list" },
                    { title: "이용 가이드", sublink: "notice_use_guide" },
                    { title: "관리자 가이드", sublink: "notice_adm_guide" },
                    { title: "프로그램 자료실", sublink: "notice_data_room" },
                    { title: "고객공지", sublink: "notice_customer_notice" }
                ]
            }
        ];
        
        // 쿠키 설정 함수
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        };
    
        // 쿠키 읽기 함수
        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for(var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        };

        var nav = $(".sidebar-collapse");

        for (var i = 0; i < navItems.length; i++) {
            var item = navItems[i];
            var li = $("<li>").addClass("nav-item").css("cursor", "pointer");
            var a = $("<a>").addClass("toggle-submenu tooltip_right")
                .css("display", "block")
                .attr({
                    "href": item.link,
                    "data-toggle": "tooltip",
                    "title": item.title
                });
            var icon = $("<i>").addClass("fa " + item.icon);
            var span = $("<span>").text(item.title);
            var angleIcon = $("<i>").addClass("fa-solid fa-angle-left side_nav_arrow").css({"float": "right", "line-height": "1.4"});
            var ul = $("<ul>").addClass("hide mt-2");
    
            a.append(icon, span, angleIcon);
            li.append(a, ul);
            nav.append(li);

            for (var j = 0; j < item.submenu.length; j++) {
                var subItem = item.submenu[j].title;
                var subLink = item.submenu[j].sublink; // submenu 항목에 대한 고유한 링크 생성
                var subLi = $("<li>").addClass("side_nav_sub_li").css({"list-style-type":"none"});
                var subA = $("<a>").addClass("subMenu").attr("href",subLink+".html").text(subItem); // 각 submenu 항목에 대한 링크 생성
                subLi.append(subA);
                ul.append(subLi);

            }
            $(".toggle-submenu").removeAttr('href');
        }

        $('.subMenu, .sec_top_menu').click(function() {
            console.log($(this).text());
            setCookie('selectedSubMenu', $(this).text(), 1);
        });
        
        var userIdx = $.cookie("userIdx");
        var userCompanyIdx = $.cookie("userCompanyIdx");

        // Nav header
        var navHeader = $('<li>').addClass('nav-header text-white').css('padding', '2.0625rem 1.5625rem').css('list-style-type', 'none');
        var profileElement = $('<div>').addClass('profile-element').css({'font-size': '0.8125rem', 'width': '170px'}).text('덴탈비서');
        // 제목 하단 info
        var profileElement2 = $('<div>').addClass('d-flex flex-column mt-2');
        var idContainer = $('<div>').addClass('d-flex');
        var idBadge = $('<div>').css({'background-color': '#706cd5', 'color': '#ffffff', 'padding': '1px 2px', 'font-size': '10px', 'font-weight': '700', 'border-radius': '2px', 'width': '59px', 'display': 'flex', 'justify-content': 'center', 'align-items': 'center', 'margin-right': '1px'}).text('ID:').append($('<span>').text(userIdx));
        var salesBadge = $('<div>').css({'background-color': '#706cd5', 'color': '#ffffff', 'padding': '1px 2px', 'font-size': '10px', 'font-weight': '700', 'border-radius': '2px', 'width': '59px', 'display': 'flex', 'justify-content': 'center', 'align-items': 'center', 'margin-left': '1px'}).text('판매상:').append($('<span>').text(userCompanyIdx));
        idContainer.append(idBadge, salesBadge);

        var versionBadge = $('<div>').css({'background-color': '#706cd5', 'color': '#ffffff', 'padding': '1px 2px', 'font-size': '10px', 'font-weight': '700', 'border-radius': '2px', 'width': '120px', 'display': 'flex', 'justify-content': 'center', 'align-items': 'center', 'margin-top': '2px'}).text('버전:v1.0 CRM 버전');
        profileElement2.append(idContainer, versionBadge);
        navHeader.append(profileElement, profileElement2);
        nav.prepend(navHeader);

        // 0번째(HOME)의 화살표 삭제
        $(".nav-item > a").eq(0).children("i").eq(1).hide();

        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        // 0번째(HOME)를 제외한 나머지 선택자를 선택.
        $(".nav-item>a").not(":first").click(function(){
            var submenu = $(this).next("ul");
            var nav_item = $(this).parent(".nav-item");

            // 다른 모든 submenu를 닫음
            $(".nav-item > ul").not(submenu).slideUp();
            // 다른 모든 nav-item의 border 초기화
            $(".nav-item").not(nav_item).css({"border-left": "none"});

            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
                $(nav_item).css({"border-left":"none"});
            }else{
                submenu.slideDown();
                $(nav_item).css({"border-left":"4px solid #A5D5D5"});
            }
        });

        var selectedSubMenu = getCookie('selectedSubMenu');
        console.log(decodeURIComponent(getCookie('selectedSubMenu')));
        if (selectedSubMenu) {
            // 선택된 하위 메뉴의 텍스트를 사용하여 상위 요소를 찾음
            var parentNavItem = $('li.side_nav_sub_li').filter(function() {
                return $(this).text().trim() === selectedSubMenu;
            }).parent().parent();

            // 선택된 하위 메뉴 표시 및 상위 메뉴 border 스타일 추가
            $('li.side_nav_sub_li').filter(function() {
                return $(this).text().trim() === selectedSubMenu;
            }).addClass("SubMenuActive");
            parentNavItem.css({"border-left":"4px solid rgb(165, 213, 213)"});

            // 해당 메뉴의 하위 메뉴 펼치기
            parentNavItem.children("ul").slideDown();
        }
    };
    side_nav_func();

    // side_nav 각 메뉴별 이동
    function side_nav_move() {
        var side_home = $(".toggle-submenu:eq(0)");
        side_home.click(() => {
            location.href = "/admin";
            $.removeCookie('selectedSubMenu');
        });

        $(".settings-0").click(() => {
            alert("준비중입니다.");
        });

        $(".settings-1").click(() => {
            location.href = "code_group_list.html"
        });
    };
    side_nav_move();

    // side_nav_min
    var side_nav_min_func = function() {
        $(".side_nav_min").click(() => {
            $("#side_nav").toggleClass("collapsed");

            $(".toggle-submenu span, .nav-header, .side_nav_arrow").toggleClass("d-none");
        });
    }

    // top_nav 생성
    var top_nav_func = function(){
        var elements = [
            { 
                text: "메뉴설정",
                iconClass: "fa fa-bars",
                dropdownMenu: false
            },
            { 
                text: "공통코드",
                iconClass: "fa fa-code",
                dropdownMenu: false
            },
            { 
                text: "사용업체관리",
                iconClass: "fa fa-building",
                dropdownMenu: false
            },
            { 
                text: "회원관리",
                iconClass: "fa fa-users",
                dropdownMenu: false
            },
            { 
                text: "게시판 관리",
                iconClass: "fa fa-list",
                dropdownMenu: false
            },
            { 
                text: "상품관리",
                iconClass: "fa fa-shopping-cart",
                dropdownMenu: false
            },
            { 
                text: "솔루션",
                iconClass: "fa fa-credit-card",
                dropdownMenu: false
            },
            { 
                text: "덴비뉴스/공지/가이드",
                iconClass: "fa fa-bullhorn",
                dropdownMenu: true,
                dropdownItems: ["덴비 뉴스", "덴비 공지", "덴비 동영상 가이드", "덴비 이벤트", "덴비 고객후기", "덴비 포트폴리오", "이용 가이드", "관리자 가이드", "프로그램 자료실", "고객공지"]
            }
        ];
    
        // .top_nav_ul 생성
        var ul = $("<ul>").addClass("top_nav_ul").css({
            "height": "100%",
            "display": "flex",
            "padding": "0",
            "margin": "0"
        });
    

        // 배열의 각 요소에 대해 반복하며 HTML을 생성합니다.
        elements.forEach(function(element) {
            var li = $("<li>").addClass("top_nav_ul_li").css({
                "height": "100%",
                "color": "#A7B1C2",
                "border-left": "1px solid #E7EAEC",
                "border-right": "1px solid #E7EAEC",
                "position" : "relative",
            });
    
            var i = $("<i>").addClass(element.iconClass).css({
                "font-size": "0.75rem",
                "display": "block",
                "text-align": "center"
            });
    
            var a = $("<a>").css({
                "font-size": "14px",
                "font-weight": "700"
            }).text(element.text);
    
            li.append(i, a);
    
            // 만약 드롭다운 메뉴가 필요하다면 추가합니다.
            if (element.dropdownMenu) {
                var dropdownItems = element.dropdownItems.map(function(item) {
                    return $("<li>").text(item);
                });
    
                var dropdownMenu = $("<ul>").attr("id", "dropdownMenu").addClass("hide").css({
                    "border": "1px solid #A7B1C2",
                    "margin-top": "8px",
                    "padding": "0",
                    "background-color": "#FFF"
                }).append(dropdownItems);
    
                li.append(dropdownMenu);
            }
    
            ul.append(li);
        });
    
        // .top_nav에 ul을 추가합니다.
        $(".top_nav").append(ul);

        $(".top_nav_ul_li").each(function() {
            // 하위에 있는 ul 요소를 찾음
            var $dropdownMenu = $(this).find("ul");
            // ul 요소가 존재하면
            if ($dropdownMenu.length) {
                // a 요소에 <i> 태그 추가
                $(this).find("a").append('<i class="fa-solid fa-caret-down" style="font-size: 0.75rem;"></i>');
                // 추가한 <i> 태그에 스타일 적용
                $(this).find("a i.fa-caret-down").css("font-size", "0.75rem");
            }
        });
        
        $(".top_nav_ul_li").click(function(event) {
            console.log($(this));
            event.stopPropagation(); // 이벤트 버블링을 막습니다.
            var minWidth = 150; // 최소 너비
            var maxWidth = 500; // 최대 너비
            var this_width = $(this).outerWidth();
            
            // 최소값과 최대값 사이로 this_width를 조정합니다.
            this_width = Math.min(Math.max(this_width, minWidth), maxWidth);
        
            // 현재 클릭한 요소의 하위에 있는 ul 요소를 찾습니다.
            var $dropdownMenu = $(this).find("ul");
            
            // 만약 하위에 ul 요소가 존재하고, hide 클래스를 가지고 있다면 토글합니다.
            if ($dropdownMenu.length && $dropdownMenu.hasClass("hide")) {
                // 다른 드롭다운 메뉴를 닫습니다.
                $(".top_nav_ul_li ul").addClass("hide");
                $dropdownMenu.removeClass("hide");
                $dropdownMenu.css({"width": this_width});
            } else {
                // 하위에 ul 요소가 없거나, hide 클래스를 가지고 있지 않다면 모든 하위 ul 요소의 hide 클래스를 추가합니다.
                $(".top_nav_ul_li ul").addClass("hide");
            }
        });

        // 문서 어느 곳을 클릭하든 드롭다운 메뉴를 닫습니다.
        $(document).click(function() {
            $(".top_nav_ul_li ul").addClass("hide");
        });

        function user_info() {
            var dropdownMenuItems = [
                { text: "로그아웃" },
                { text: "덴비 홈페이지" }
            ];
            var userLv = $.cookie('userLv');
            var userName = $.cookie('userName');;

            var adminListItem = $("<li>").css({
                "display": "flex",
                "justify-content": "end",
                "align-items": "center",
                "cursor": "pointer",
                "position": "relative",
                "height": "100%",
                "padding": "0 10px"
            }).addClass("user_info");
        
            // Admin 텍스트 추가
            var adminText = $("<span>").css({
                "font-size": "14px",
                "font-weight": "900",
                "color": "#ADB6C4"
            }).text(userName);
        
            // 레벨 텍스트 추가
            var levelText = $("<span>").css({
                "width": "32px",
                "height": "15px",
                "background-color": "#706cd5",
                "color": "#ffffff",
                "font-size": "10px",
                "display": "flex",
                "justify-content": "center",
                "align-items": "center",
                "border-radius": "2px",
                "margin-left": "5px"
            }).text(userLv);
        
            // 로그아웃과 덴비 홈페이지를 포함하는 ul 요소 생성
            var dropdownMenu = $("<ul>").attr("id", "dropdownMenu").addClass("hide").css({
                "border": "1px solid rgb(167, 177, 194)",
                "padding": "0px",
                "top": "60px",
                "left": "-100px",
                "width": "200px",
                "background-color": "#FFF"
            });
        
            // 드롭다운 메뉴 항목을 추가
            dropdownMenuItems.forEach(function(item) {
                var menuItem = $("<li>").text(item.text);
                dropdownMenu.append(menuItem);
            });
        
            // 생성한 모든 요소를 adminListItem에 추가
            adminListItem.append(adminText, levelText, dropdownMenu);
        
            // top_nav 클래스를 찾아 생성한 li 요소를 추가
            $(".top_nav").append(adminListItem);
        
            // user_info 박스를 클릭했을 때 드롭다운 메뉴를 토글합니다.
            adminListItem.click(function(event) {
                event.stopPropagation();
                var $dropdownMenu = $(this).find("ul");
                if ($dropdownMenu.length && $dropdownMenu.hasClass("hide")) {
                    $(".user_info ul").addClass("hide");
                    $dropdownMenu.removeClass("hide");
                    // $dropdownMenu.css({"width": this_width});
                } else {
                    $(".user_info ul").addClass("hide");
                }
            });
        
            // 문서의 다른 부분을 클릭했을 때 드롭다운 메뉴를 숨깁니다.
            $(document).click(function() {
                $(".user_info ul").addClass("hide");
            });
        }
        user_info();
    };
    top_nav_func();

});