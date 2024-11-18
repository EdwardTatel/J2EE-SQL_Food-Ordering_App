package FinalsPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AccountDao {

    public int registerAccount(Account account) throws ClassNotFoundException {
        int result = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "")) {
            String INSERT_USERS_SQL = "INSERT INTO account (email, username, pass, confirmpass, contact) VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
                preparedStatement.setString(1, account.getEmail());
                preparedStatement.setString(2, account.getUsername());
                preparedStatement.setString(3, account.getPassword());
                preparedStatement.setString(4, account.getConfirmpass());
                preparedStatement.setString(5, account.getContact());
                System.out.println(preparedStatement);
                result = preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException)e).getSQLState());
                System.err.println("Error Code: " + ((SQLException)e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}