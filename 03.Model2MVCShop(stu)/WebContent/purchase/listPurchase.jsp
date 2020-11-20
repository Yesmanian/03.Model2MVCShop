<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ�����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetUserList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
							���� �̷���ȸ
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input 	type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  class="ct_input_g" 
							style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<c:set var="i" value="0"/>
		<c:forEach var="vo" items="${list }">
		<c:set var="i" value="${i+1}"/>
		
		<tr class="ct_list_pop">
			<td align="center">
				
				<a href="/getPurchase.do?tranNo=${vo.tranNo }&tranCode=${vo.tranCode}">${i }</a>	
			</td>
			<td></td>
			<td align="left">
				<a href="/getUser.do?userId=${vo.buyer.userId }">${vo.buyer.userId }</a>
			<td></td>
			<td align="left">${vo.buyer.userName }</td>
			<td></td>
			<td align="left">${vo.receiverPhone }</td>
			<td></td>
			<td align="left">
			
			
				<c:choose>
					<c:when test="${vo.tranCode == '1'}">
						���� ����غ����Դϴ�
					</c:when>
					<c:when test="${vo.tranCode == '2'}">
						���� ������Դϴ�
					</c:when>
					<c:when test="${vo.tranCode == '3'}">
						���� ��� �Ϸ� �����Դϴ�
					</c:when>
				</c:choose>
			
			</td>
			<td></td>
			
			<td align="left">
			
				<c:choose>
					<c:when test="${vo.tranCode == '1'}">
						tranCode 1
					</c:when>
					<c:when test="${vo.tranCode == '2'}">
						<a href="/updateTranCode.do?tranNo=${vo.tranNo }&tranCode=3">���ǵ���</a>
					</c:when>
					<c:when test="${vo.tranCode == '3'}">
						tranCode 3
					</c:when>
				</c:choose>
			
			</td>
			
			<!--�Ƹ��� ������� �Ǹ��� ���°� 
			<td align="left">
			
				�Ǹ���
			
			</td>	-->
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>	
	
	</c:forEach>	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>