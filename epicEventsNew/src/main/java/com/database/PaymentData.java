package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Interfaces.PaymentInterface;
import com.databaseUtility.DatabaseManager;
import com.model.payment.Payment;
import com.model.payment.PaymentDetails;
import com.model.payment.UserPaymentData;


public class PaymentData implements PaymentInterface {

	@Override
	public int addPayment(Payment pay) throws ClassNotFoundException {
	    // Define your SQL query
	    String INSERT_PAYMENT = "INSERT INTO payment (Customer_name,cardNo,ExpireDate,cvv,accept,property_name) VALUES (?, ?, ?, ?, ?, ?)";
	    
	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT)) {
	        
	        // Set parameters for the PreparedStatement

	    	preparedStatement.setString(1, pay.getCardHolder());
	    	preparedStatement.setString(2, pay.getCardNo());
	        preparedStatement.setString(3, pay.getExpDate());
	        preparedStatement.setString(4, pay.getCvv());
	        preparedStatement.setString(5, "Pending");
	        preparedStatement.setString(6, pay.getPropertyName());
	        // Execute the query
	        int rowsAffected = preparedStatement.executeUpdate();
	        
	        // Return the number of rows affected (should be 1 if the insertion is successful)
	        return rowsAffected;
	        
	    } catch (SQLException e) {
	        // Handle any SQL exceptions
	        e.printStackTrace(); // Log the exception for debugging purposes
	        
	        // Optionally, you can throw an exception or return an error code to indicate failure
	        return -1; // Return -1 to indicate failure
	    }
	}

	public List<Payment> getUserPayments() throws SQLException {
		
        List<Payment> userPayments = new ArrayList<>();
        
        String GET_USER_PAYMENT = "SELECT * FROM payment";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_PAYMENT)) {

            //preparedStatement.setInt(1, SessionManager.getUsersID()); // Set the user ID

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                	
                	Payment paydata = new Payment();
                    
                    paydata.setCardHolder(resultSet.getString("Customer_name"));
                    paydata.setCardNo(resultSet.getString("cardNo"));
                    paydata.setCvv(resultSet.getString("cvv"));
                    paydata.setExpDate(resultSet.getString("ExpireDate"));;
                    paydata.setAccept(resultSet.getString("accept"));
                    paydata.setPayment_id(resultSet.getInt("payment_id"));
                    paydata.setPropertyName(resultSet.getString("property_name"));
                                      
                    userPayments.add(paydata);
                    
                    System.out.println();
                }
            }
        }
        
        return userPayments;
    }
	
	public int deletePayment(UserPaymentData delPay) throws ClassNotFoundException {
		
	    String DELETE_PAYMENT = "DELETE FROM payment WHERE payment_id = ?";
	    
	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PAYMENT)) {
	        
	    	
	        preparedStatement.setInt(1, delPay.getPaymentId());
	        
	        int rowsAffected = preparedStatement.executeUpdate();
	        
	        
	        return rowsAffected;
	        
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	        
	        return -1;
	    }
		
	}

	public int updatePayment(PaymentDetails upPay) throws ClassNotFoundException {
		
	    String UPDATE_PAYMENT = "UPDATE payment SET accept = ? WHERE payment_id = ?;";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT)) {

	        
	        preparedStatement.setString(1, upPay.getAccept());
	        preparedStatement.setInt(2, upPay.getPaymentId());
	        

	        
	        int rowsUpdated = preparedStatement.executeUpdate();

	        return rowsUpdated;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        
	        return 0;
	    }
	}


}
