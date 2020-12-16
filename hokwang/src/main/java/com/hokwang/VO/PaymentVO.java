package com.hokwang.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {//결제
	String pay_no;//결제 번호
	String pay_method;//결제 수단
	String pay_price;//결제 금액
	Date pay_date;//결제 일시
	String pay_account;//계좌번호
	String pay_bank;//은행명
	String pay_state;//결제 상태

}
