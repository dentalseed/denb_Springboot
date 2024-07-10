<!--kebord start-->
<script>
    var ohi_menu_num = 1;
    var cur_input_id = "";
    var Ko_type = '2-KSX5002'; // 한글 자판
    var En_type = 'QWERTY'; // 영문 자판
    var ohi_KBD_type = 'QWERTY'; // 기준 자판 (QWERTY, QWERTZ, AZERTY)
    var ohi_KE = 'Ko'; // 시작할 때의 한·영 상태 (한글: Ko, 영문: En)

    
    
</script>
<style>
    #keyboard .col {
        padding: 3px
    }

    #keybord_ko_dialog .btn-xs-dim {
        font-size: 2em !important;
    }
</style>
<!--kebord start-->
<script src="<?= IM_PLUGIN_URL?>/keybord_plugin/js/keyboard_layouts.js?v=<?= time() ?>"></script>
<script src="<?= IM_PLUGIN_URL?>/keybord_plugin/js/additional_layouts.js?v=<?= time() ?>"></script>
<script src="<?= IM_PLUGIN_URL?>/keybord_plugin/js/keybord.js?v=<?= time() ?>"></script>
<!-- kr/en keybord -->
<div id="keybord_motal_overlay" class="modal-backdrop in" style="display:none;z-index: 1000; background-color: #999999;opacity:0.5;"></div>
<div id="keybord_ko_dialog" class="col-lg-10" style="display: none;">
    <div class="modal-content bg-light">
        <div class="modal-body">
            <center>
                <label class="text-info h6 m-b"><i class="fa fa-exclamation-circle fa-lg mr-xs"></i> 이름 입력 하세요</label>
                <button type="button" class="btn btn-secondary btn-circle float-right m-t-n-xs" onclick="idcard_keybord_close()"><span aria-hidden="true">×</span></button>
            </center>
            <div class="m-b">
                <input type="text" id="keybord_ko_input_text" placeholder="이름" class="form-control border-size-sm font-bold text-center hei-70 border-primary bg-white" maxlength="4" readonly="readonly" style="font-size:2.5em;" οnchange="keybord_input_onchange();">
            </div>
            <div id="keyboardLayoutTable_KO" title="한글">
                <div id="row1" class="row float-e-margins no-gutters justify-content-center">
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key15" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅂ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key16" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅈ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key17" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㄷ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key18" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㄱ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key19" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅅ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key20" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅛ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key21" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅕ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key22" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅑ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key23" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅐ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key24" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅔ
                    </button>
                </div>
                <div id="row2" class="row float-e-margins no-gutters justify-content-center">

                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key29" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅁ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key30" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㄴ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key31" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅇ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key32" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㄹ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key33" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅎ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key34" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅗ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key35" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅓ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key36" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅏ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key37" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅣ
                    </button>
                </div>
                <div id="row3" class="row float-e-margins no-gutters justify-content-center">
                    <button class="col-2 btn btn-default btn-xs-dim border-muted font-bold bg-muted" id="key41" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        <i class="feather icon-arrow-up"></i><small class="font-bold">Shift</small>
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key42" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅋ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key43" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅌ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key44" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅊ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key45" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅍ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key46" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅠ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key47" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅜ
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key48" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        ㅡ
                    </button>
                    <button class="col-2 btn btn-gray btn-xs-dim border-muted font-bold bg- " id="key13" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        <i class="feather icon-delete"></i>
                    </button>
                </div>
                <div id="row4" class="row float-e-margins no-gutters justify-content-center">
                    <button class="col btn btn-default btn-xs-dim border-muted font-bold" id="key57" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">English</button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key56" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">스페이스</button>
                    <button class="col btn btn-success btn-xs-dim border-muted " type="button" onclick="keybord_ko_complet()"><i class="feather icon-check"></i> 완료</button>
                </div>
            </div>
            <div id="keyboardLayoutTable_EN" style="display: none;">
                <div id="row1" class="row float-e-margins no-gutters justify-content-center">
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key15" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        q
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key16" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        w
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key17" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        e
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key18" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        r
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key19" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        t
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key20" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        y
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key21" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        u
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key22" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        i
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key23" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        o
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key24" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        p
                    </button>
                </div>
                <div id="row2" class="row float-e-margins no-gutters justify-content-center">
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key29" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        a
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key30" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        s
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key31" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        d
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key32" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        f
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key33" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        g
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key34" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        h
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key35" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        j
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key36" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        k
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key37" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        l
                    </button>
                </div>
                <div id="row3" class="row float-e-margins no-gutters justify-content-center">
                    <button class="col-2 btn btn-default btn-xs-dim border-muted bg-muted" id="key28" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        <i class="feather icon-arrow-up"></i><small class="font-bold">Shift</small>
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key42" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        z
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key43" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        x
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key44" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        c
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key45" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        v
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key46" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        b
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key47" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        n
                    </button>
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key48" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        m
                    </button>
                    <button type="button" class="col-2 btn btn-default btn-xs-dim border-muted bg-muted" id="key13" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">
                        <i class="feather icon-delete"></i>
                    </button>
                </div>
                <div id="row4" class="row float-e-margins no-gutters justify-content-center">
                    <button type="button" class="col btn btn-default btn-xs-dim border-muted font-bold" id="key57" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">한글</button>
                    <button class="col btn btn-default btn-xs-dim border-muted font-bold" id="key56" onclick="tableKey_clicked(event, this.id.substr(3), dkey[this.id.substr(3)], ukey[this.id.substr(3)]);">SPACE</button>
                    <button class="col btn btn-success btn-xs-dim border-muted font-bold" type="button" onclick="keybord_ko_complet()"><i class="feather icon-check"></i> Enter</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 주민등록번호용 -->
<div id="keybord_id_card_dialog" class="modal-md" style="display: none;">
    <div class="modal-content bg-light">
        <div class="modal-body">
            <center>
                <label class="text-info h6 m-b"><i class="fa fa-exclamation-circle fa-lg mr-xs"></i> 주민등록번호 (외국인등록번호) 입력 하세요</label>
                <button type="button" class="btn btn-secondary btn-circle float-right m-t-n-xs" onclick="idcard_keybord_close()"><span aria-hidden="true">×</span></button>
            </center>
            <div id="keyboard">
                <div class="row no-gutters">
                    <div class="col input-group m-b ">
                        <input type="text" id="keybord_id_card_input" placeholder="" class="form-control border-size-sm font-bold text-center hei-70 border-primary bg-white" maxlength="" readonly="readonly" style="font-size:3em">
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col ">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('1')">1</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('2')">2</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('3')">3</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('4')">4</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('5')">5</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('6')">6</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('7')">7</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('8')">8</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('9')">9</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted bg-muted" onclick="idcard_keybord_delete_number()"><i class="feather icon-delete"></i></button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="idcard_keybord_add_number('0')">0</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-success btn-sm-dim w-100 btn-" onclick="idcard_keybord_submit_number()"><i class="feather icon-check"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 휴대폰용 -->
<div id="keybord_phone_dialog" class="modal-md" style="display: none;">
    <div class="modal-content bg-light">
        <div class="modal-body">
            <center>
                <label class="text-info h6 m-b"><i class="fa fa-exclamation-circle fa-lg mr-xs"></i> 휴대전화 입력 하세요</label>
                <button type="button" class="btn btn-secondary btn-circle float-right m-t-n-xs" onclick="phone_keybord_close()"><span aria-hidden="true">×</span></button>
            </center>
            <div id="keyboard">
                <div class="row no-gutters">
                    <div class="col input-group m-b ">
                        <input type="text" id="keybord_phone_number_input" placeholder="" class="form-control border-size-sm font-bold text-center hei-70 border-primary bg-white" maxlength="" readonly="readonly" style="font-size:3em">
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col ">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('1')">1</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('2')">2</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('3')">3</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('4')">4</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('5')">5</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('6')">6</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('7')">7</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('8')">8</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('9')">9</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted bg-muted" onclick="phone_keybord_delete_number()"><i class="feather icon-delete"></i></button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="phone_keybord_add_number('0')">0</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-success btn-sm-dim w-100 btn-" onclick="phone_keybord_submit_number()"><i class="feather icon-check"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 인증번호 혹은 숫자용 -->
<div id="keybord_number_dialog" class="modal-md" style="display: none;">
    <div class="modal-content bg-light">
        <div class="modal-body">
            <center>
                <label class="text-info h6 m-b"><i class="fa fa-exclamation-circle fa-lg mr-xs"></i> 인증번호 입력 하세요</label>
                <button type="button" class="btn btn-secondary btn-circle float-right m-t-n-xs" onclick="number_keybord_close()"><span aria-hidden="true">×</span></button>
            </center>
            <div id="keyboard">
                <div class="row no-gutters">
                    <div class="col input-group m-b ">
                        <input type="text" id="keybord_number_input" placeholder="" class="form-control border-size-sm font-bold text-center hei-70 border-primary bg-white" maxlength="" readonly="readonly" style="font-size:3em">
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col ">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('1')">1</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('2')">2</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('3')">3</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('4')">4</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('5')">5</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('6')">6</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('7')">7</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('8')">8</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('9')">9</button>
                    </div>
                </div>

                <div class="row no-gutters">
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted bg-muted" onclick="number_keybord_delete_number()"><i class="feather icon-delete"></i></button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-default btn-sm-dim font-bold w-100 border-muted" onclick="number_keybord_add_number('0')">0</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-success btn-sm-dim w-100 btn-" onclick="number_keybord_submit_number()"><i class="feather icon-check"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // keybord                
    function gotoTab(n) {
        ohi_menu_num = n;
        for (var i = 1; i <= 3; i++) {
            document.getElementById('menu' + i).className = (i == n) ? 'this' : 'menu';
            document.getElementById('tab' + i).style.height = (i == n) ? 'auto' : '1px';
            //document.getElementById('tab'+i).style.position = (i==n) ? '' : 'absolute';
            document.getElementById('tab' + i).style.overflow = (i == n) ? 'visible' : 'hidden';
            document.getElementById('tab' + i).style.visibility = (i == n) ? 'visible' : 'hidden';
        }
        document.getElementById('manual').style.display = (n != 3) ? 'block' : 'none';
        show_keyboard_layout();
    }

    function appendChild(parentNode, nodeName, className, idName, innerHTML, width, padding, display) {
        //console.log(idName);
        var childNode = document.createElement(nodeName);
        if (className) childNode.className = className;
        if (idName) childNode.id = idName;
        if (innerHTML) childNode.innerHTML = innerHTML;
        if (width) childNode.style.width = width;
        if (display) childNode.style.display = display;
        if (padding) childNode.style.padding = padding;
        parentNode.appendChild(childNode);
        return childNode;
    }

    var keybord_input_text = "";

    function close_all_keybord_dialog() {
        $("#keybord_ko_dialog").hide();
        $("#keybord_id_card_dialog").hide();
        $("#keybord_phone_dialog").hide();
        $("#keybord_number_dialog").hide();
        $("#keybord_motal_overlay").hide();
    }
    // 한글 키보드 
    function show_ko_keybord_dialog(id) {
        if($("#"+id).attr("keybord_on")!="1")
        {
            return false;
        }
        keybord_input_text = id;
        //$("#nmpd1").hide();
        $("#keybord_ko_dialog").css("z-index", 100000);
        close_all_keybord_dialog();

        $("#keybord_motal_overlay").show();
        $("#keybord_motal_overlay").on('click', function(e) {
            $("#keybord_motal_overlay").hide();
            keybord_ko_complet();
        });

        $("#keybord_ko_input_text").val($("#" + keybord_input_text).val());
        $('#keybord_ko_dialog').css({
            position: 'absolute',
            left: ($(window).width() - $('#keybord_ko_dialog').outerWidth()) / 2,
            top: ($(window).height() - $('#keybord_ko_dialog').outerHeight()) / 2 + $(document).scrollTop()
        });
        $("#keybord_ko_dialog").show();
    }

    function keybord_ko_input_onchange() {
        //console.log($("#inputText").val());
        $("#" + keybord_input_text).val($("#keybord_ko_input_text").val());
    }

    function keybord_ko_complet() {
        close_all_keybord_dialog();
        $("#" + keybord_input_text).val($("#keybord_ko_input_text").val());
        $("#keybord_ko_dialog").hide();
    }

    function replace_in_range(str, start, end, replacement) {
        var prefix = str.slice(0, start);
        var suffix = str.slice(end);
        var range = str.slice(start, end);
        var replacedRange = range.replace(/./g, replacement);
        return prefix + replacedRange + suffix;
    }

    // ***************************************************주민등록 keybord
    var keybord_idcard_num_1_id = "";
    var keybord_idcard_num_2_id = "";
    var keybord_idcard_num_value = "";
    /**
     * id1:보여주때 사용
     * id2: 보여줄대 사용
     * id3: 값저장 hidden id
     */
    function show_idcard_keybord_dialog(id1, id2, id3, title) {
        if($("#"+id1).attr("keybord_on")!="1")
        {
            return false;
        }

        keybord_idcard_num_1_id = id1;
        keybord_idcard_num_2_id = id2;
        keybord_idcard_num_value = id3;

        $('#keybord_id_card_title').html(title);
        $('#keybord_id_card_input').attr("placeholder", title);

        $("#keybord_motal_overlay").show();

        var str = $("#" + keybord_idcard_num_1_id).val() + $("#" + keybord_idcard_num_2_id).val();
        var group_1 = str.substring(0, 6);
        var group_2 = str.substring(6, 13);

        if (group_1.length == 6) {
            str = group_1 + "-" + group_2;
        }

        $('#keybord_id_card_input').val(str);
        if(str=="")
        {
            $('#'+keybord_idcard_num_value).val('');
        }

        $('#keybord_id_card_dialog').css({
            position: 'absolute',
            "z-index": '1000000',
            left: ($(window).width() - $('#keybord_id_card_dialog').outerWidth()) / 2,
            top: ($(window).height() - $('#keybord_id_card_dialog').outerHeight()) / 2 + $(document).scrollTop()
        });
        $("#motal_overlay").show();
        $("#keybord_id_card_dialog").show();
        $("#motal_overlay").on('click', function(e) {
            $("#motal_overlay").hide();
            idcard_keybord_submit_number();
        });
    }

    function idcard_keybord_close() {
        close_all_keybord_dialog();
    }

    // 외부에서 만 사용
    function get_idcard_keybord_value_group_1(id)
    {
        var value = $('#'+id).val().trim();
        value = value.replace(/-/g, "");
        var group_1 = value.substring(0, 6);
        return group_1;
    }
    // 외부에서 만 사용
    function get_idcard_keybord_value_group_2(id)
    {
        var value = $('#'+id).val().trim();
        value = value.replace(/-/g, "");
        var group_2 = value.substring(6, 13);
        return group_2;
    }

    function idcard_keybord_add_number(number) {
        $('#keybord_id_card_input').val($('#keybord_id_card_input').val() + number);
        var obj_value = $('#'+keybord_idcard_num_value);
        obj_value.val(obj_value.val() + number);
        var str = obj_value.val();
        ///////////////////
        str = str.replace(/-/g, "");
        var group_1 = str.substring(0, 6);
        var group_2 = str.substring(6, 13);
        if (group_1.length == 6) {
            obj_value.val(group_1 + "-" + group_2);
        }        
        console.log("idcard_num value:"+obj_value.val());
        ///////////////////
        str = $('#keybord_id_card_input').val();
        str = str.replace(/-/g, "");

        group_1 = str.substring(0, 6);
        group_2 = str.substring(6, 13);
        var group_2_view = "";
        if(group_2!="")
        {
            //group_2_view = replace_in_range(group_2, 1,6, '●');
            group_2_view = replace_in_range(group_2, 1,6, '⦁');
            
            //console.log("strtemp:"+group_2_view);
        }

        if (group_1.length == 6) {
            $('#keybord_id_card_input').val(group_1 + "-" + group_2_view);
        }
    }

    function idcard_keybord_delete_number() {
        //document.getElementById('id_card_number').value = residentNumberInput.value.slice(0, -1);
        $('#keybord_id_card_input').val($('#keybord_id_card_input').val().slice(0, -1));
        var obj = $('#'+keybord_idcard_num_value);
        obj.val(obj.val().slice(0, -1));
        //console.log("idcard_num value:"+$('#'+keybord_idcard_num_value).val());
    }

    function idcard_keybord_clear_number() {
        $("#" + keybord_idcard_num_1_id).val("");
        $("#" + keybord_idcard_num_2_id).val("");
        $('#keybord_id_card_input').val("");
        $('#'+keybord_idcard_num_value).val("");
        //console.log("idcard_num value:"+$('#'+keybord_idcard_num_value).val());
    }

    function idcard_keybord_submit_number() {
        let residentNumber = $('#keybord_id_card_input').val();
        residentNumber = residentNumber.replace(/-/g, "")
        $("#" + keybord_idcard_num_1_id).val(residentNumber.substring(0, 6));
        $("#" + keybord_idcard_num_2_id).val(residentNumber.substring(6, 13));
        // 팝업 닫기
        close_all_keybord_dialog();
    }
    // ***************************************************휴대폰용  keybord
    var keybord_phone_num_1_id = "";

    function show_phone_keybord_dialog(id1, title) {        
        if($("#"+id1).attr("keybord_on")!="1")
        {
            return false;
        }

        keybord_phone_num_1_id = id1;
        $('#keybord_phone_number_title').html(title);
        $('#keybord_phone_number_input').attr("placeholder", title);

        $('#keybord_phone_number_input').val($("#" + keybord_phone_num_1_id).val());

        $('#keybord_phone_dialog').css({
            position: 'absolute',
            "z-index": '1000000',
            left: ($(window).width() - $('#keybord_phone_dialog').outerWidth()) / 2,
            top: ($(window).height() - $('#keybord_phone_dialog').outerHeight()) / 2 + $(document).scrollTop()
        });
        $("#keybord_motal_overlay").show();
        $("#keybord_phone_dialog").show();
        $("#keybord_motal_overlay").on('click', function(e) {
            $("#keybord_motal_overlay").hide();
            phone_keybord_submit_number();
        });
    }

    function phone_keybord_close() {
        close_all_keybord_dialog();
    }

    function phone_keybord_add_number(number) {
        $('#keybord_phone_number_input').val($('#keybord_phone_number_input').val() + number);
        var str = $('#keybord_phone_number_input').val();
        str = str.replace(/-/g, "");
        //console.log(str);
        var group_1 = str.substring(0, 3);
        var group_2 = str.substring(3, 7);
        var group_3 = str.substring(7, 11);

        if (group_1.length == 3) {
            str = group_1;
        }
        if (group_2 != "") {
            str = str + "-" + group_2;
        }
        if (group_3 != "") {
            str = str + "-" + group_3;
        }
        $('#keybord_phone_number_input').val(str);
    }

    function phone_keybord_delete_number() {
        //document.getElementById('id_card_number').value = residentNumberInput.value.slice(0, -1);
        $('#keybord_phone_number_input').val($('#keybord_phone_number_input').val().slice(0, -1));
    }

    function phone_keybord_clear_number() {
        $("#" + keybord_phone_num_1_id).val("");
        $('#keybord_phone_number_input').val("");
    }

    function phone_keybord_submit_number() {
        let phone_num = $('#keybord_phone_number_input').val();

        $("#" + keybord_phone_num_1_id).val(phone_num);
        // 팝업 닫기
        close_all_keybord_dialog();
    }

    // ***************************************************숫자용 keybord
    var keybord_number_1_id = "";
    var keybord_number_limit_len = 0;

    function show_number_keybord_dialog(id1, title, limit_len) {
        if($("#"+id1).attr("keybord_on")!="1")
        {
            return false;
        }
        keybord_number_1_id = id1;
        keybord_number_limit_len = limit_len;
        $('#keybord_number_title').html(title);
        $('#keybord_number_input').attr("placeholder", title);

        $('#keybord_number_input').val($("#" + keybord_number_1_id).val());

        $('#keybord_number_dialog').css({
            position: 'absolute',
            "z-index": '1000000',
            left: ($(window).width() - $('#keybord_number_dialog').outerWidth()) / 2,
            top: ($(window).height() - $('#keybord_number_dialog').outerHeight()) / 2 + $(document).scrollTop()
        });
        $("#keybord_motal_overlay").show();
        $("#keybord_number_dialog").show();
        $("#keybord_motal_overlay").on('click', function(e) {
            $("#keybord_motal_overlay").hide();
            number_keybord_submit_number();
        });
    }

    function number_keybord_close() {
        close_all_keybord_dialog();
    }

    function number_keybord_add_number(number) {
        $('#keybord_number_input').val($('#keybord_number_input').val() + number);
        if (keybord_number_limit_len > 0) {
            $('#keybord_number_input').val($('#keybord_number_input').val().substring(0, keybord_number_limit_len));
        }
    }

    function number_keybord_delete_number() {
        //document.getElementById('id_card_number').value = residentNumberInput.value.slice(0, -1);
        $('#keybord_number_input').val($('#keybord_number_input').val().slice(0, -1));
    }

    function number_keybord_clear_number() {
        $("#" + keybord_number_1_id).val("");
        $('#keybord_number_input').val("");
    }

    function number_keybord_submit_number() {
        let num = $('#keybord_number_input').val();

        $("#" + keybord_number_1_id).val(num);
        // 팝업 닫기
        close_all_keybord_dialog();
    }
</script>