/*
 * @Author: your name
 * @Date: 2021-12-24 10:24:06
 * @LastEditTime: 2022-01-07 18:20:22
 * @LastEditors: your name
 * @Description: 
 * @FilePath: \denb\js\jquery.register_form.js
 * 
 */
var reg_mb_id_check = function() {
    var result = "";
    $.ajax({
        type: "POST",
        url: "../login/ajax.mb_id.php",
        data: {
            "reg_mb_id": encodeURIComponent($("#reg_mb_id").val())
        },
        cache: false,
        async: false,
        success: function(data) {
            result = data;
        }
    });
    return result;
}

var reg_mb_hp_check = function() {
    var result = "";
    $.ajax({
        type: "POST",
        url: "../login/ajax.mb_hp.php",
        data: {
            "reg_mb_hp": $("#reg_mb_hp").val(),
            "reg_mb_id": encodeURIComponent($("#reg_mb_id").val())
        },
        cache: false,
        async: false,
        success: function(data) {
            result = data;
        }
    });
    return result;
}


var reg_patient_hp_check = function() {
    var result = "";
    $.ajax({
        type: "POST",
        url: "../login/ajax.patient_hp.php",
        data: {
            "reg_mb_hp": $("#reg_mb_hp").val(),
            "dentist_idx": $("#dentist_idx").val(),
        },
        cache: false,
        async: false,
        success: function(data) {
            result = data;
        }
    });
    return result;
}