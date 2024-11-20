package com.Interfaces;

import java.sql.SQLException;
import java.util.List;

import com.model.payment.Payment;
import com.model.payment.PaymentDetails;
import com.model.payment.UserPaymentData;

public interface PaymentInterface {
	
	public int addPayment(Payment pay) throws ClassNotFoundException;
	
	public List<Payment> getUserPayments() throws SQLException;
	
	public int deletePayment(UserPaymentData delPay) throws ClassNotFoundException;
	
	public int updatePayment(PaymentDetails upPay) throws ClassNotFoundException;
}
