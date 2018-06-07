<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <!--Bootstrap Table Sample [ SAMPLE ]-->
    <script src="<c:url value='/resources/js/demo/tables-bs-table.js'/>"></script>

    <!--X-editable [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/x-editable/js/bootstrap-editable.min.js'/>"></script>

    <!--Bootstrap Table [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/bootstrap-table/bootstrap-table.min.js'/>"></script>

    <!--Bootstrap Table Extension [ OPTIONAL ]-->
    <script src="<c:url value='/resources/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js'/>"></script>

    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="<c:url value="/resources/css/demo/nifty-demo-icons.min.css"/>" rel="stylesheet">
    
    <!--Premium Solid Icons [ OPTIONAL ]-->
    <link href="<c:url value="/resources/premium/icon-sets/icons/solid-icons/premium-solid-icons.css"/>" rel="stylesheet">
    
   <!--=================================================-->
    
	<!--Modals [ SAMPLE ]-->
    <script src="<c:url value="/resources/js/demo/ui-modals.js"/>"></script>
    
    <!--jQuery [ REQUIRED ]-->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>

    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="<c:url value="/resources/js/nifty.min.js"/>"></script>
    
    
    <!--Bootbox Modals [ OPTIONAL ]-->
    <script src="<c:url value="/resources/plugins/bootbox/bootbox.min.js"/>"></script>
    
    <script type="text/javascript">
   
    // 게시글 삭제
    
    function docommentdelete(){
        bootbox.dialog({
            title: "댓글을 삭제 하시겠습니까?",
            message:'삭제하시면 복구 하실 수 없습니다.',
            buttons: {
                success: {
                    label: "Delete",
                    className: "btn-pink",
                    
                    callback: function() {
                    	
                        var currentPageNo = $('#currentPageNo').val();
                        var seq = $('#seq').val();
                        var commentseq = $('#commentseq').val();
                        
                        // 컨트롤러로 보낼 파라미터 설정
                        var params = {};
                        params.currentPageNo = currentPageNo;
                        params.commentseq = commentseq;  
                        params.seq = seq;  
                        params = JSON.stringify(params);
                        
                        // 댓글 작성
                        $.ajax({
                              url: '<c:url value="/commentDelete.do"/>',
                              type:'POST',
                              data : params,
                              dataType:"json",// 파라미터를 json으로 했기 때문에 data type json으로
                              contentType:"application/json",
                              mimeType:"application/json",
                              success : function (data, textStatus, XMLHttpRequest) {
                                   alert(data.msg);
                                   if(data.code == "ok"){     // submit coment 눌렀을 때 정상 들록 되었을 경우
                                         movePage(null, '/read.do', {'seq':seq, 'currentPageNo':currentPageNo});
                                   }
                                   else if(data.code == "no"){// 로그인 안한상태에서 글쓰기 버튼 눌렀을 때
                                         movePage(null, '/error.do', {'nextLocation':"/loginPage.do"});
                                   }
                              },
                              error : function (XMLHttpRequest, textStatus, errorThrown) {
                                   alert(XMLHttpRequest.responseText);
                              }
                        });
  
                        $.niftyNoty({
                            type: 'pink',
                            icon : 'pli-like-2 icon-2x',
                            message : "댓글이 삭제 되었습니다.",
                            container : 'floating',
                            timer : 3000
                        });
                    }
                }
            }
        });
    }
    
    
   
    </script>
    
	<div id="page-head">
                    
                    <!--Page Title-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <font style="font-family: 나눔스퀘어라운드 Regular">
                    <div id="page-title">
                        <h1 class="page-header text-overflow">자유게시판</h1>
                    </div>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->


                    <!--Breadcrumb-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <ol class="breadcrumb">
					<li><a href="<c:url value="/index_login.do"/>"><i class="demo-pli-home"></i></a></li>
					<li><a href="#">게시판</a></li>
					<li class="active">${board.boardNumber}번 글</li>
                    </ol>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End breadcrumb-->
					</font>
                </div>
			     
                <!--Page content-->
                <!--===================================================-->
 				<div id="page-content">
                    	<input type="hidden" id="currentPageNo" value="${currentPageNo}" />
                    	<input type="hidden" id="seq" value="${result.seq}" />
                    	
					    <div class="panel blog blog-details">
					        <div class="panel-body">
					            <div class="blog-title media-block">
					             <!-- Contact Toolbar -->
							     <!---------------------------------->
							     <div class="row pad-btm">
							           <div class="col-sm-6 col-sm-offset-6 toolbar-right text-right">
							           		<a onclick="movePage(this, '/boardList.do',{currentPageNo:'${currentPageNo}'})">
							                	<button class="btn btn-default">List</button>
							                </a>
							                <c:if test="${sessionScope.userName == board.userId}">
							                <a onclick="movePage(this,'/goupdate.do', {boardNumber:'${board.boardNumber}', currentPageNo:'${currentPageNo}'})">
							                	<button class="btn btn-default">Edit</button>
							                </a>
							                 <a onclick="movePage(this,'/delBoard.do', {boardNumber:'${board.boardNumber}', currentPageNo:'${currentPageNo}'})">
							               
							              		<button onclick="dodelete()" id="btn btn-pink" class="btn btn-primary example-button">Delete</button>
							           		
							           		</a>
							           		</c:if>
							           </div>
							     </div>
							     <!---------------------------------->
					                <div class="media-body">
					                        <h1>${board.title}</h1>

					                    <p>By <font color="#489CFF" size="2px"><b>${board.userId}</b></font></p>
					                </div>

					            </div>
					           
					            <div class="blog-content">
					                <div class="blog-body">
					                    ${board.content}
					                </div>
					            </div>
					            <div class="blog-footer">
					                <div class="media-left">
					                    <span class="label label-success"><b>${board.regDate}</b></span>
					                </div>
					                <div class="media-body text-right">
					                    <span class="mar-rgt"><i class="psi-glasses"></i>　${result.hits}</span>
					                    <i class="demo-pli-speech-bubble-5 icon-fw"></i> ${count}
					                </div>
					            </div>
					            <hr>
									            <!-- Attach Files -->
				            <!-- =================================================== -->
				            <div class="pad-ver">
				               <p class="text-main text-bold box-inline">
				                  <font color="black" size="4px"><i class="demo-psi-paperclip icon-fw"></i>Attachments</font>
				               </p>
				               
				             <!--File list item-->
			                  <c:forEach items="${attachment}" var="a">
			                     <a href="<c:url value='/fileDownload.do?attachSeq=${a.attachSeq}'/>"
			                        class="file-details">
			                              <div class="media-left">
			                                 <font size="6px"><i class="psi-file-download"></i></font>
			                              </div>
			                              <div class="media-body">
			                                 <p class="file-name">${a.fileName}</p>
			                                 <small>${a.createDate} (<fmt:formatNumber pattern="#,##0" value="${a.fileSize/1024}"/> KB)</small>
			                              </div>
				                     </a>
				                  </c:forEach>
				            </div>
				            <!--===================================================-->
				            <!-- End Attach Files-->
					
					           
					        </div>
					    </div>
                </div>


                <!--===================================================-->
                <!--End page content-->
