package com.controll.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.payment.Payment;


/**
 * Servlet implementation class UpdatePaymentByIdServlet
 */
@WebServlet("/UpdatePaymentByIdServlet")
public class UpdatePaymentByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentByIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String paymentId = request.getParameter("paymentId");
        String cardHname = request.getParameter("cardHname");
        String CardNo = request.getParameter("CardNo");
        String cvv = request.getParameter("cvv");
        String expDate = request.getParameter("expDate");
        String propertyName = request.getParameter("propertyName");
        String accept = request.getParameter("accept");
        
        Integer paymentIdInt = Integer.parseInt(paymentId);
    
        Payment updatedpayment = new Payment();
        
        updatedpayment.setPayment_id(paymentIdInt);
        updatedpayment.setCardHolder(cardHname);
        updatedpayment.setCardNo(CardNo);
        updatedpayment.setCvv(cvv);
        updatedpayment.setExpDate(expDate);
        updatedpayment.setPropertyName(propertyName);
        updatedpayment.setAccept(accept);

        request.setAttribute("PaymentDetails", updatedpayment);
        request.getRequestDispatcher("updatePaymentById.jsp").forward(request, response);
	}

}
