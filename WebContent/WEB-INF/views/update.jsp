<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Summernote [ OPTIONAL ]-->
<link href="<c:url value='/resources/plugins/summernote/summernote.min.css'/> " rel="stylesheet">
<!--Dropzone [ OPTIONAL ]-->
<link href="<c:url value='/resources/plugins/dropzone/dropzone.min.css'/> " rel="stylesheet">
<!--Demo [ DEMONSTRATION ]-->
<link href="<c:url value='/resources/css/demo/nifty-demo.min.css'/>" rel="stylesheet">
<!--Demo script [ DEMONSTRATION ]-->
<script src="<c:url value='/resources/js/demo/nifty-demo.js'/>"></script>
<!--Summernote [ OPTIONAL ]-->
<script src="<c:url value='/resources/plugins/summernote/summernote.min.js'/>"></script>
<!--Dropzone [ OPTIONAL ]-->
<script src="<c:url value='/resources/plugins/dropzone/dropzone.js'/>"></script>
<!--Form File Upload [ SAMPLE ]-->
<script src="<c:url value='/resources/js/demo/form-file-upload.js'/>"></script>
<!--Custom script [ DEMONSTRATION ]-->
<!--===================================================-->
<script type="text/javascript">
       // 첨부파일 업로드 결과 저장하는 배열
       var uploadedFile = [];
       // 기존 업로드 결과
       var alreadyUploadFile = [];
       $(document).ready(function() {
             // DROPZONE.JS
             // =================================================================
             // Require Dropzone
             // http://www.dropzonejs.com/
             // =================================================================
             $('#demo-dropzone').dropzone({
                    url: '<c:url value="/fileUpload.do?docType=free"/>',
                    //autoProcessQueue: false,
                    uploadMultiple: true,
                    maxFilesize: 10,    // MB
                    addRemoveLinks : true,
                    parallelUploads: 5,
                    maxFiles : 5,
                    init : function() {
                           var myDropzone = this;
                           myDropzone.on('maxfilesexceeded', function(file) {
                                 this.removeAllFiles();
                                 this.addFile(file);
                           });
                           myDropzone.on("addedfile", function(file){ });
                        // remove 누르면 removdfile
							myDropzone
									.on(
											"removedfile",
											function(file) {
												console.log(file);
												console.log(uploadedFile)
												// 삭제한 파일을 배열에서 찾아 배열을 재구성한다.
												uploadedFile = $
														.grep(
																uploadedFile,
																function(e) {
																	$.ajax({
									                                       
								                                         url: '<c:url value="delfile.do"/>',
								                                         
								                                         type: "post",
								                                            //  키         값
								                                         data: {'fakeName' : e.fakeName, 'attachSeq' : e.attachSeq},
								                                        // callback 함수 결과가 돌아옴
								                                         success: function(result, textStatus, jqXHR){
								                                         // result 는 controller에서 보내주는값
								                                               
								                                               
								                                         },
								                                         error: function(jqXHR, textStatus, errorThrown){
								                                                console.log(jqXHR);
								                                                console.log(textStatus);
								                                                console.log(errorThrown);
								                                           }          
								                                         });
																	return e.filename != file.name;
																});
												
												alreadyUploadFile = $
														.grep(
																alreadyUploadFile,
																function(e) {
																	$.ajax({
									                                       
								                                         url: '<c:url value="delfile.do"/>',
								                                         
								                                         type: "post",
								                                            //  키         값
								                                         data: {'fakeName' : e.fakeName,'attachSeq' : e.attachSeq},
								                                        // callback 함수 결과가 돌아옴
								                                         success: function(result, textStatus, jqXHR){
								                                         // result 는 controller에서 보내주는값
								                                               
								                                               
								                                         },
								                                         error: function(jqXHR, textStatus, errorThrown){
								                                                console.log(jqXHR);
								                                                console.log(textStatus);
								                                                console.log(errorThrown);
								                                           }          
								                                         });
																	return e.filename != file.name;
																});
											});
												
                           // 첨부파일이 임시 폴더에 저장이 되면 complete
                           myDropzone.on("complete", function(result){
                                 uploadedFile = $.parseJSON(result.xhr.response);
                           });
                           
                           // 기존에 첨부된 파일 정보 다 가져오기 위해 ajax 호출
                           $.ajax({
                                 url: '<c:url value="/getAttachedFiles.do"/>',
                                 data : {docType:'free', postNum:$('#postNum').val()},
                                 success : function (data, textStatus, XMLHttpRequest) {
//                                      console.log(data);
                                        
                                        // 첨부파일 정보를 기존 업로드 결과에 저장
                                        alreadyUploadFile = data;
                                        
                                        // forEach로 하나씩 꺼내어서
                                        $.each(data, function(idx, file){
                                               console.log(file);
                                               /*
                                                     attachDocSeq: 387
                                                     attachDocType : "free"
                                                     attachSeq : 51
                                                     contentType : "text/xml"
                                                     createDate : 1524150000000
                                                     fakeName : "190f6a83-3751-44fe-98a3-35d8021c049d"
                                                     fileSize : 3181
                                                     filename : "SQL.Departments.xml"
                                               */
                                               //  dropzone에 표시하기 위해 Object 생성
                                               var mockFile = { name: file.filename, size: file.fileSize, type: file.contentType, attachSeq : file.attachSeq};
                                               var icon = '';
                                               /*
                                                     contentType에 따라 아이콘 지정 가능...
                                                     switch(file.contentType){
                                                     case 'image/png', 'image/jpeg' :
                                                            icon = "<c:url value='/resources/img/icon/image.png'/>";
                                                            break;
                                                     default :
                                                            icon = "<c:url value='/resources/img/icon/document.png'/>";
                                               } */
                                               icon = "<c:url value='/resources/img/icon/document.png'/>";
                                               myDropzone.addFile.call(myDropzone, mockFile);
                                               myDropzone.options.thumbnail.call(myDropzone, mockFile, icon);
                                        });
                                        
                                 },
                                 error : function (XMLHttpRequest, textStatus, errorThrown) {
                                        $(tabId, myLayout.panes.center).html(XMLHttpRequest.responseText);
                                 }
                           });
                    }
             });
             // SUMMERNOTE
             // =================================================================
             // Require Summernote
             // http://hackerwins.github.io/summernote/
             // =================================================================
             $('#demo-summernote, #demo-summernote-full-width').summernote({
                    height : '300px'
             });
             
             // 저장 버튼 클릭
             $('#btnSave').click(function(){
                    // summernote api어케 찾아오는지...
                    var content = $('#demo-summernote, #demo-summernote-full-width').summernote('code');
                    if(content.length == 0){
                           alert("글 써");
                           return;
                    }
                    
                    var title = $('#title').val();
                    if(title.length == 0){
                           alert("글 써");
                           return;
                    }
                    // 컨트롤러로 보낼 파라미터 설정
                    var params = {};
                    params.postNum = $('#postNum').val();   // 글번호
                    params.title = title;      // 글제목
                    params.content = content;  // 글내용
                    
                    // 기존에 업로드 되어 있던 파일 정보를 신규 업로드 결과로 합치기
                    $.each(alreadyUploadFile, function(idx, f){
                           uploadedFile.push(f);
                    });
                    
                    params.attaches = uploadedFile;  // 드래그앤드랍으로 첨부한 파일정보
                    params = JSON.stringify(params); // json으로 바꿔야 함.
                    // 글 수정
                    $.ajax({
                           url: '<c:url value="/update.do"/>',
                           type:'POST',
                           data : params,
                           dataType:"json",    // 파라미터를 json으로 했기 때문에 data type json으로
                           contentType:"application/json",
                           mimeType:"application/json",
                           success : function (data, textStatus, XMLHttpRequest) {
                                 alert(data.msg);
                                 if(data.code == "ok"){     // 로그인 한 후 글쓰기 버튼 눌렀을 때
                                        movePage(null, '/read.do?boardNumber=${board.boardNumber}&currentPageNo=${currentPageNo}');
                                 }
                                 else if(data.code == "no"){      // 로그인 안한상태에서 글쓰기 버튼 눌렀을 때
                                        movePage(null, '/error.do', {'nextLocation':"/loginPage.do", 'currentPageNo':currentPageNo});
                                 }
                           },
                           error : function (XMLHttpRequest, textStatus, errorThrown) {
                                 alert(XMLHttpRequest.responseText);
                           }
                    });
             });
       });
</script>
<div id="page-head">
       <!--Page Title-->
       <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
       <div id="page-title">
             <h1 class="page-header text-overflow">EditPage</h1>
       </div>
       <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
       <!--End page title-->
       <!--Breadcrumb-->
       <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
       <ol class="breadcrumb">
             <li><a href=""><i class="demo-pli-home"></i></a></li>
             <li><a href="#">Freeboard</a></li>
             <li class="active">EditPage</li>
       </ol>
       <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
       <!--End breadcrumb-->
</div>
<!--Page content-->
<!--===================================================-->
<div id="page-content">
       <input type="hidden" id="postNum" value="${board.boardNumber}">;
       <input type="hidden" id="currentPageNo" value="${currentPageNo}">;
       
       <!-- Contact Toolbar -->
       <!---------------------------------->
       <div class="row pad-btm">
             <div class="col-sm-6 col-sm-offset-6 toolbar-right text-right">
                    <a onclick="movePage(this, '/read.do?boardNumber=${board.boardNumber}')">
                           <button class="btn btn-default">Cancel</button>
                    </a>
                    <button class="btn btn-pink" id="btnSave">Save</button>
             </div>
       </div>
       <!---------------------------------->
       <div class="fixed-fluid">
             <div class="fluid">
                    <div class="form-group">
                           <input type="text" id="title" value="${board.title}" class="form-control input-lg" autofocus>
                    </div>
                    <div class="panel">
                           <div class="panel-body">
                                 <!--Summernote-->
                                 <div id="demo-summernote">
                                        <!-- 입력 한 글 contents부분 -->
                                        <p>${board.content}</p>
                                 </div>
                                 <!-- End Summernote -->
                           </div>
                    </div>
             
                    <div class="panel">
                        <div class="panel-body">
                           <p class="text-main text-bold mar-no">첨부파일</p>
                            <br/>
                            <!--Dropzonejs-->
                            <!--===================================================-->
                            <form id="demo-dropzone" action="#" class="dropzone">
                                <div class="dz-default dz-message">
                                    <div class="dz-icon">
                                        <i class="demo-pli-upload-to-cloud icon-5x"></i>
                                    </div>
                                    <div>
                                        <span class="dz-text">Drop files to upload</span>
                                        <p class="text-sm text-muted">or click to pick manually</p>
                                    </div>
                                </div>
                                <div class="fallback">
                                    <input name="file[]" type="file" multiple>
                                </div>
                            </form>
                            <!--===================================================-->
                            <!-- End Dropzonejs -->
                        </div>
                    </div>
             </div>
       </div>
</div>
<!--===================================================-->
<!--End page content-->