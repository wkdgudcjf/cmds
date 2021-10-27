<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="format-detection" content="telephone=no">
  <title>CMDS</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/static/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="/static/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/static/css/style.css">
  <!-- endinject -->
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex align-items-center   theme-one" style="background:#fff">


        <div class="row w-100">


          <div class="col-lg-4 mx-auto">
            <div class="auto-form-wrapper">
			
				<div>
					<h2 class="text-center"><img style="width:80%; margin:0 auto; display:block" src="/static/sample.png" alt="" /></h2>
				</div>

              <form:form action="/register" method="post" modelAttribute="user">
                <div class="form-group">
                  <div class="input-group">
                    <form:input path="email" class="form-control" placeholder="User Email"/>
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group">
                    <form:input path="password" id="password" type="password" class="form-control" placeholder="Password"/>
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group">
                    <input id="passwordConfirm" type="password" class="form-control" placeholder="Confirm Password">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
                    
                 <div class="form-group">
			         <div class="form-radio form-radio-flat disabled">
			        	<label class="form-check-label">
			        	    <input type="checkbox" id="agree1" class="form-check-input"> 이용약관에 동의
			   		     	<i class="input-helper"></i>
					    </label>
				     </div>
			    </div>
                
                <div class="form-group">
			         <div class="form-radio form-radio-flat disabled">
			        	<label class="form-check-label">
			        	    <input type="checkbox" id="agree2" class="form-check-input"> 개인정보 처리방침 동의
			   		     	<i class="input-helper"></i>
					    </label>
				     </div>
			    </div>
			  		                   
                <div class="form-group">
                   <Button type="button" class="btn btn-success submit-btn btn-block" data-toggle="modal" data-target="#agree1modal">이용약관 보기</Button>
                </div>
                
                <div class="form-group">
                    <Button type="button" class="btn btn-success submit-btn btn-block" data-toggle="modal" data-target="#agree2modal">개인정보 처리방침 보기</Button>
                </div>
               
                <div class="form-group">
                  <button class="btn btn-primary submit-btn btn-block">회원가입</button>
                </div>
                <div class="text-block text-center my-3">
                  <span class="text-small font-weight-semibold">이미 회원이신가요? ?</span>
                  <a href="/login" class="text-black text-small">Login</a>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  
   <!-- agree1 Modal -->
    <div class="modal fade" id="agree1modal" tabindex="-1" role="dialog" aria-labelledby="agree1Label" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="agree1Label">이용약관에 동의</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          	서비스 이용약관
			<br/>
			<br/>
			제1조(목적)
			<hr/>
			본 회원약관은 OOOOO(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.
			<br/>
			<br/>
			제2조 (약관의 효력)
			<hr/>
			1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.
			<br/>
			2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
			<br/>
			3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.
			<br/>
			<br/>
			제3조 (약관 이외의 준칙)
			<hr/>
			이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.
			<br/>
			<br/>
			제4조 (이용계약의 체결)
			<hr/>
			회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.
			<br/>
			<br/>
			제5조 (용어의 정의)
			<hr/>
			이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
			<br/>
			1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자
			<br/>
			2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합
			<br/>
			3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
			<br/>
			<br/>
			제6조 (이용신청)
			<hr/>
			1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.
			<br/>
			2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.
			<br/>
			<br/>
			제7조 (회원가입의 승낙)
			<hr/>
			'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.
			<br/>
			<br/>
			제8조(회원가입 신청거절 및 강제 탈퇴)
			<hr/>
			1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.
			<br/>
			2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.
			<br/>
			<br/>
			제9조 (서비스 제공의 중지)
			<hr/>
			'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다
			<br/>
			1.설비의 보수 등을 위하여 부득이한 경우 
			<br/>
			2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 
			<br/>
			3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.
			<br/>
			<br/>
			제10조 ('갑'의 의무)
			<hr/>
			1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.
			<br/>
			2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.   
			<br/>
			<br/>
			제11조 (개인정보보호)
			<hr/>
			1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. 
			<br/>
			2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. 
			<br/>
			①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  
			<br/>
			②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
			<br/>
			③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
			<br/>
			④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
			<br/>
			3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.
			<br/>
			<br/>
			제12조 (회원의 의무)
			<hr/>
			1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.
			<br/>
			2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.
			<br/>
			3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
			<br/>
			4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.
			<br/>
			5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.
			<br/>
			  ①다른 회원의 아이디(ID)를 부정 사용하는 행위
			<br/>
			  ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
			<br/>
			  ③선량한 풍속, 기타 사회질서를 해하는 행위
			<br/>
			  ④타인의 명예를 훼손하거나 모욕하는 행위  
			<br/>
			  ⑤타인의 지적재산권 등의 권리를 침해하는 행위 
			<br/>
			  ⑥해킹행위 또는 컴퓨터바이러스의 유포행위  
			<br/>
			  ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위  
			<br/>
			  ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
			<br/>
			  ⑨기타 관계법령에 위배되는 행위  
			<br/>
			  ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위
			<br/>
			<br/>
			제13조 (게시물 또는 내용물의 삭제) 
			<hr/>
			'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.
			<br/>
			<br/>
			제14조 (게시물에 대한 권리·의무)
			<hr/>
			게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.
			<br/>
			<br/>
			제15조 (양도금지)
			<hr/>
			회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
			<br/>
			<br/>
			제16조 (계약해지 및 이용제한) 
			<hr/>
			1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.
			<br/>
			2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.
			<br/>
			<br/>
			제17조 (면책·배상)
			<hr/>
			1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.
			<br/>
			2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 
			<br/>
			3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.
			<br/>
			4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.
			<br/>
			<br/>
			제18조 (분쟁의 해결) 
			<hr/>
			1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.
			<br/>
			2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.
			<br/>
			<br/>
			부  칙
			<hr/>
			제 1 조 (시행일) 이 약관은 2019년 03월 01일부터 시행한다. 
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
    
  <!-- agree2 Modal -->
    <div class="modal fade" id="agree2modal" tabindex="-1" role="dialog" aria-labelledby="agree2Label" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="agree2Label">개인정보 처리방침 동의</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
          	(주)OOO社 개인정보 처리방침
          	<hr/>
			(주)OOO社(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다. 
			<br/>
			<br/>
			제1조(개인정보의 처리목적)
			<hr/>
			처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 
			<br/>
			1. 홈페이지 회원 가입 및 관리 
			<br/>
			회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다. 
			<br/>
			2. 재화 또는 서비스 제공 
			<br/>
			물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다. 
			<br/>
			3. 고충처리 
			<br/>
			민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다. 
			<br/>
			<br/>
			제2조(개인정보의 처리 및 보유기간)
			<hr/>
			① 회사는 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다. 
			<br/>
			② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 
			<br/>
			1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지 
			<br/>
			다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지 
			<br/>
			1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지 
			<br/>
			2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지 
			<br/>
			2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지
			<br/>
			다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지 
			<br/>
			1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록 
			<br/>
			- 표시․광고에 관한 기록 : 6월 
			<br/>
			- 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년 
			<br/>
			- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년 
			<br/>
			2)「통신비밀보호법」제41조에 따른 통신사실확인자료 보관
			<br/>
			- 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년 
			<br/>
			- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
			<br/>
			<br/>
			제3조(개인정보의 제3자 제공)
			<hr/>
			① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다. 
			<br/>
			② 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
			<br/>
			- 개인정보를 제공받는 자 : (주) OOO 카드
			<br/>
			- 제공받는 자의 개인정보 이용목적 : 이벤트 공동개최 등 업무제휴 및 제휴 신용카드 발급 
			<br/>
			- 제공하는 개인정보 항목 : 성명, 주소, 전화번호, 이메일주소, 카드결제계좌정보, 신용도정보 
			<br/>
			- 제공받는 자의 보유․이용기간 : 신용카드 발급계약에 따른 거래기간동안
			<br/>
			<br/>
			제4조(개인정보처리의 위탁)
			<hr/>
			① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. 
			<br/>
			1. 전화 상담센터 운영 
			<br/>
			- 위탁받는 자 (수탁자) : OOO 컨택센터 
			<br/>
			- 위탁하는 업무의 내용 : 전화상담 응대, 부서 및 직원 안내 등 
			<br/>
			2. A/S 센터 운영 
			<br/>
			- 위탁받는 자 (수탁자) : OOO 전자 
			<br/>
			- 위탁하는 업무의 내용 : 고객 대상 제품 A/S 제공 
			<br/>
			② 회사는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. 
			<br/>
			③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다. 
			<br/>
			<br/>
			제5조(정보주체의 권리․의무 및 행사방법)
			<hr/>
			① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다. 
			<br/>
			1. 개인정보 열람요구
			<br/>
			2. 오류 등이 있을 경우 정정 요구
			<br/>
			3. 삭제요구 
			<br/>
			4. 처리정지 요구 
			<br/>
			② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다. 
			<br/>
			③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다. 
			<br/>
			④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. 
			<br/>
			⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다. 
			<br/>
			<br/>
			제6조(처리하는 개인정보 항목) 
			<hr/>
			1. 홈페이지 회원 가입 및 관리 
			<br/>
			․필수항목 : 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호 
			<br/>
			․선택항목 : 결혼여부, 관심분야 
			<br/>
			2. 재화 또는 서비스 제공 
			<br/>
			․필수항목 : 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보 등 결제정보 
			<br/>
			․선택항목 : 관심분야, 과거 구매내역 
			<br/>
			3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
			<br/>
			․IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등 
			<br/>
			<br/>
			제7조(개인정보의 파기)
			<hr/>
			① 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. 
			<br/>
			② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 
			<br/>
			③ 개인정보 파기의 절차 및 방법은 다음과 같습니다. 
			<br/>
			1. 파기절차 
			<br/>
			회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다. 
			<br/>
			2. 파기방법 
			<br/>
			회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다. 
			<br/>
			<br/>
			제8조(개인정보의 안전성 확보조치) 
			<hr/>
			1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등 
			<br/>
			2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 
			<br/>
			3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제 
			<br/>
			<br/>
			제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)
			<hr/>
			① 회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.
			<br/>
			② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
			<br/>
			가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
			<br/>
			나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
			<br/>
			다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
			<br/>
			<br/>
			제10조(개인정보 보호책임자)
			<hr/>
			① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. 
			<br/>
			▶ 개인정보 보호책임자 
			<br/>
			성명 : OOO 
			<br/>
			직책 : OOO 이사 
			<br/>
			연락처 : 전화번호, 이메일, 팩스번호 
			<br/>
			※ 개인정보 보호 담당부서로 연결됩니다. 
			<br/>
			▶ 개인정보 보호 담당부서 
			<br/>
			부서명 : OOO 팀 
			<br/>
			담당자 : OOO 
			<br/>
			연락처 : 전화번호, 이메일, 팩스번호 
			<br/>
			② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다. 
			<br/>
			<br/>
			제11조(개인정보 열람청구)
			<br/>
			정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. 
			<hr/>
			▶ 개인정보 열람청구 접수․처리 부서 
			<br/>
			부서명 : OOO
			<br/>
			담당자 : OOO 
			<br/>
			연락처 : 전화번호, 이메일, 팩스번호 
			<br/>
			<br/>
			제12조(권익침해 구제방법)
			<br/>
			정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다. 
			<br/>
			아래의 기관은 회사와는 별개의 기관으로서, 회사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다
			<hr/>
			▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영) 
			<br/>
			- 소관업무 : 개인정보 침해사실 신고, 상담 신청 
			<br/>
			- 홈페이지 : privacy.kisa.or.kr 
			<br/>
			- 전화 : (국번없이) 118 
			<br/>
			- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터
			<br/>
			▶ 개인정보 분쟁조정위원회
			<br/>
			- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결) 
			<br/>
			- 홈페이지 : www.kopico.go.kr 
			<br/>
			- 전화 : (국번없이) 1833-6972
			<br/>
			- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층
			<br/>
			▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)
			<br/>
			▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)
			<br/>
			<br/>
			제13조(영상정보처리기기 설치․운영)
			<hr/>
			① (사업자/단체명) 은(는) 아래와 같이 영상정보처리기기를 설치․운영하고 있습니다. 
			<br/>
			1. 영상정보처리기기 설치근거․목적 : (사업자/단체명) 의 시설안전․화재예방
			<br/>
			2. 설치 대수, 설치 위치, 촬영 범위 : 사옥 로비․전시실 등 주요시설물에 00대 설치, 촬영범위는 주요시설물의 전 공간을 촬영 
			<br/>
			3. 관리책임자, 담당부서 및 영상정보에 대한 접근권한자 : OOO 팀 OOO 과장 
			<br/>
			4. 영상정보 촬영시간, 보관기간, 보관장소, 처리방법 
			<br/>
			- 촬영시간 : 24시간 촬영
			<br/>
			- 보관기간 : 촬영시부터 30일 
			<br/>
			- 보관장소 및 처리방법 : OOO팀 영상정보처리기기 통제실에 보관․처리
			<br/>
			5. 영상정보 확인 방법 및 장소 : 관리책임자에 요구 (OOO팀) 
			<br/>
			6. 정보주체의 영상정보 열람 등 요구에 대한 조치 : 개인영상정보 열람․존재확인 청구서로 신청하여야 하며, 정보주체 자신이 촬영된 경우 또는 명백히 정보주체의 생명․신체․재산 이익을 위해 필요한 경우에 한해 열람을 허용함 
			<br/>
			7. 영상정보 보호를 위한 기술적․관리적․물리적 조치 : 내부관리계획 수립, 접근통제 및 접근권한 제한, 영상정보의 안전한 저장․전송기술 적용, 처리기록 보관 및 위․변조 방지조치, 보관시설 마련 및 잠금장치 설치 등
			<br/>
			<br/>
			제14조(개인정보 처리방침 변경)
			<hr/>
			① 이 개인정보 처리방침은 20XX. X. X부터 적용됩니다.
			<br/>
			② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다. 
			<br/>
			- 20XX. X. X ~ 20XX. X. X 적용 (클릭) 
			<br/>
			- 20XX. X. X ~ 20XX. X. X 적용 (클릭) 
			          	
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="/static/vendors/js/vendor.bundle.base.js"></script>
  <script src="/static/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="/static/js/off-canvas.js"></script>
  <script src="/static/js/misc.js"></script>
  <!-- endinject -->
  <script>
      <spring:hasBindErrors name="user">
        alert('${errors.allErrors[0].defaultMessage}');
      </spring:hasBindErrors>

    $('form').on('submit', function(e) {
        if ($('#password').val() !== $('#passwordConfirm').val()) {
            alert('비밀번호 두 개가 다릅니다.');
            return false;
        }

        if (!$('input[name=email]').val()) {
            alert('이메일을 입력해주세요.');
            return false;
        }

        if (!$('#password').val()) {
            alert('비밀번호를 입력해주세요.');
            return false;
        }

        if (!$('#agree1').prop("checked")) {
            alert('이용약관에 동의해주세요.');
            return false;
        }

        if (!$('#agree2').prop("checked")) {
            alert('개인정보 처리방침에 동의해주세요.');
            return false;
        }
    });
  </script>
</body>

</html>