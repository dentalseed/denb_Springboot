// 공통코드 화면 버튼 클릭 이벤트
function sortBtnEvent() {
    $(".sortBtn").click(function(){
        var checkIcon = '<i class="fa fa-check" style="margin-right: 2px;"></i>';

        $(".sortBtn").removeClass("sortBtnActive");
        $(".sortBtn .fa-check").remove();
        $(this).addClass("sortBtnActive");
        $(this).prepend(checkIcon);
    });

    $(".sortBtn02").click(function(){
        var checkIcon = '<i class="fa fa-check" style="margin-right: 2px;"></i>';

        $(".sortBtn02").removeClass("sortBtnActive02");
        $(".sortBtn02 .fa-check").remove();
        $(this).addClass("sortBtnActive02");
        $(this).prepend(checkIcon);
    });

    $(".mediCategoryBtn").click(function(){
        var checkIcon = '<i class="fa fa-check" style="margin-right: 2px;"></i>';

        $(".mediCategoryBtn").removeClass("mediCategoryBtnAct");
        $(".mediCategoryBtn .fa-check").remove();
        $(this).addClass("mediCategoryBtnAct");
        $(this).prepend(checkIcon);
    });
};

// 체크박스 클릭시 전체 선택
function selectAllNoEvent(allCheck, target) {
    $(allCheck).change(function() {
        var isChecked = $(this).prop('checked');
        $(target).prop('checked', isChecked);
    });

    $(target).change(function() {
        var isChecked = $(this).prop('checked');
        if (!isChecked) {
            $(allCheck).prop('checked', false);
        }
    });
}

// 회원관리 > selectbox 검색 기능
function selectSearch() {
    $("#dropdownTrigger").click(function(event) {
        $(".dropdown-content").toggle();
    });
    
    $("#searchInput").keyup(function() {
        var filter = $(this).val().toUpperCase();
        var $dropdownList = $("#dropdownList");
        var $dropdownContent = $(".dropdown-content");
        var $noResults = $("#noResults");

        // 검색 결과 초기화
        $dropdownList.find('.dropdownOption').hide();
        $noResults.hide();

        // 필터링 및 결과 처리
        var $visibleOptions = $dropdownList.find('.dropdownOption').filter(function() {
            var text = $(this).text().toUpperCase();
            return text.indexOf(filter) > -1;
        });

        // 결과가 없는 경우
        if ($visibleOptions.length === 0) {
            $noResults.show();
            $dropdownContent.height(50); // 결과 없을 때 높이 조정
        } else {
            // 결과에 따라 높이 조정
            var minHeight = 90; // 최소 높이
            var maxHeight = 250; // 최대 높이
            var height = Math.min($visibleOptions.length * 30, maxHeight)+30; // 개수에 따라 높이 조정

            $dropdownContent.height(height);

            $visibleOptions.show();
        }
    });
    
    // 이벤트 전파 중단
    $("#searchInput").click(function(event) {
        event.stopPropagation();
    });
    
    $("#dropdownList li").click(function(event) {
        var selectedText = $(this).text();
        $(".dropdown-content").hide();
        $(".dropDownSelectVal").css({"color":"#000"}).html(selectedText);
        $("#dropdownTrigger").css({"background-color":"#FFF"});
        event.stopPropagation(); // 이벤트 전파 중단
    });

    $(document).click(function(event) {
        if (!$(event.target).closest('.dropdown').length) {
            $(".dropdown-content").hide();
        }
    });
}

function chartFunc() {
    var chart = c3.generate({
        bindto: '#chartEx01', // 차트가 표시될 위치 지정
        data: {
            x: "dataReason",
            columns: [
                ['dataReason', '네 내원을 하겠습니다', '아니요 예약변경을 원합니다', '취소합니다'],
                ['횟수', 506, 67, 58]
            ],
            type: 'bar',
            color: function (color, chartValue) {
                // 막대 색상을 여기서 지정
                return '#6D68D5';
            },
            labels: true, // 막대 위에 라벨 표시
        },
        bar: {
            width: {
                ratio: 0.4 // 막대 너비 조절
            }
        },
        axis: {
            x: {
                type: "category",
            },
            y: {
                label: {
                    position: 'outer-middle' // y 축 라벨 위치 설정
                },
                tick: {
                    format: d3.format(",") // y 축 값 형식 지정
                }
            }
        }
    });

    var chadonutEx01 = c3.generate({
        bindto: '#pieEx01',
        data: {
            columns: [
                ['네 내원을 하겠습니다', 506],
                ['아니요 예약변경을 원합니다', 67],
                ['취소합니다', 58]
            ],
            type : 'pie',
            colors: {
                '네 내원을 하겠습니다': '#F2808C', // 첫 번째 데이터 열의 색상
                '아니요 예약변경을 원합니다': '#FFBC65', // 두 번째 데이터 열의 색상
                '취소합니다': '#BEA1D9' // 세 번째 데이터 열의 색상
            }
        },
        donut: {
            title: "파이 차트"
        }
    });

    setTimeout(function () {
        chart.load({});
        chadonutEx01.load({});
    }, 1);

    var parentG = $('.c3-legend-item').parent();
    parentG.css({'display': 'flex', 'flex-direction': 'column'});
}

$(document).ready(function(){
    sortBtnEvent();
    selectSearch();
    selectAllNoEvent("#selectAllNo", ".checkBoxNo");
    if (['df_data_statistic'].some(path => window.location.href.includes(path))) {
        chartFunc();
    }
});