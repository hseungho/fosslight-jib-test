<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/constants.jsp"%>
<script type="text/javascript">
//<![CDATA[
	/*global $ */
	/*jslint browser: true, nomen: true */
	var lastsel;
	$(document).ready(function () {
		'use strict';
		
		sentList.load();
		sentList.setUrl();
	});
	
	// 함수
	var fn = {
		getDefaultIdNo: function(){
			var ids = [];
			ids = $("#list").jqGrid('getDataIDs');
			
			return (ids.length == 0) ? 0 :ids[0];
		},
		searchDatePick : function(element) {
		    $(element).datepicker();
		}
	};
	
	
	// 코드 Grid
	var sentList = {
		load: function(){
			$("#list").jqGrid({
				url: ''
				, datatype: 'json'
				, jsonReader: {
					repeatitems: false,
					//id:'cdNo',
					id:'sndSeq',
					root:function(obj){return obj.rows;},
					page:function(obj){return obj.page;},
					total:function(obj){return obj.total;},
					records:function(obj){return obj.records;}
				}
				, colNames: ['sndSeq','Mail Type','Status', 'Subject', 'Sent Date', 'Requestor', 'Error', 'emlMessage', 'To', 'Cc']
				, colModel: [
                    {name: 'sndSeq', index: 'sndSeq', key:true, hidden:true},
					{name: 'msgType', index: 'msgType', width: 40, align: 'center', template: searchStringOptions},
					{name: 'sndStatus', index: 'sndStatus', width: 40, align: 'center', template: searchStringOptions
					/* ,formatter:'select', stype: 'select', searchoptions:{ sopt:['eq'], value: ":All;C:Completed;F:Failed" } */
					},
					{name: 'emlTitle', index: 'emlTitle', width: 150, align: 'left', template: searchStringOptions},
					{name: 'creationDate', index: 'creationDate', width: 70, align: 'center', template: searchDateOptions},
					{name: 'creationUserId', index: 'creationUserId', width: 70, align: 'left', template: searchStringOptions},
					{name: 'errorMsg', index: 'errorMsg',  width: 100, align: 'left', template: searchStringOptions},
					{name: 'emlMessage', index: 'emlMessage', hidden:true},
					{name: 'emlTo', index: 'emlTo', hidden:false, template: searchStringOptions},
					{name: 'emlCc', index: 'emlCc', hidden:false, template: searchStringOptions}
				]
				, emptyrecords: "Nothing to display"
				, autoencode: true
				, editurl: 'clientArray'
				, rowNum: ${ct:getConstDef("DISP_PAGENATION_DEFAULT")}
				, rowList: [${ct:getConstDef("DISP_PAGENATION_LIST_STR")}]
  				, autowidth: true
				, pager: '#pager'
				, gridview: true
				, sortable: function (permutation) {}
				, sortname: 'sndSeq'
				, sortorder: 'desc'
				, viewrecords: true
				, height: 'auto'
				, loadonce: false
				// 데이터 로딩 후
				,loadComplete: function(data) {}
				// 다른 row 클릭 시
				, onSelectRow: function(rowid,status,eventObject) {
					// 코드상세 목록 load
					$("#list").jqGrid("getGridParam", "selrow");
					$("#sentMailTo").text("TO : " + $("#list").jqGrid("getRowData", rowid).emlTo);
					$("#sentMailCc").text("CC : " + $("#list").jqGrid("getRowData", rowid).emlCc);
					$("#sentMailContents").html($("#list").jqGrid("getRowData", rowid).emlMessage);
				}
				// row 더블클릭 시 편집모드
				, ondblClickRow: function(rowid,iRow,iCol,e) {}
			});
			
            $("#list").jqGrid('navGrid',"#pager",{edit:false,add:false,del:false,search:false,refresh:false});
       		$("#list").jqGrid('filterToolbar',{stringResult: true, searchOnEnter: true, searchOperators: true, defaultSearch: "cn"});
       	},
       	setUrl: function(){
       		$("#list").jqGrid('setGridParam', {url: '<c:url value="/system/sentMail/listAjax"/>'});
        }
	};
//]]>
</script>