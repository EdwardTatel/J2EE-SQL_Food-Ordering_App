package FinalsPackage;

import java.sql.Timestamp;
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDao {

	public int insertOrder(int userId, List<String> orderNameList, List<Float> orderPriceList, List<Integer> orderQuantityList) throws ClassNotFoundException {
        int result = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "")) {
            String selectMaxOrderNumberQuery = "SELECT MAX(order_number) FROM orders;";
            try (PreparedStatement selectMaxOrderNumberStmt = connection.prepareStatement(selectMaxOrderNumberQuery)) {
                ResultSet resultSet = selectMaxOrderNumberStmt.executeQuery();
                int maxOrderNumber = 0;
                if (resultSet.next()) {
                    maxOrderNumber = resultSet.getInt(1);
                }
                String orderNumber = String.valueOf(maxOrderNumber + 1);

                Date date = new Date();
                Timestamp orderDate = new Timestamp(date.getTime());

                String INSERT_ORDER_SQL = "INSERT INTO orders (user_id, order_number, order_name, order_price, order_quantity, order_date) VALUES (?, ?, ?, ?, ?, ?);";

                try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL)) {
                    for (int i = 0; i < orderNameList.size(); i++) {
                        preparedStatement.setInt(1, userId); 
                        preparedStatement.setString(2, orderNumber); 
                        preparedStatement.setString(3, orderNameList.get(i));
                        preparedStatement.setFloat(4, orderPriceList.get(i) * orderQuantityList.get(i)); 
                        preparedStatement.setInt(5, orderQuantityList.get(i));
                        preparedStatement.setTimestamp(6, orderDate); 
                        preparedStatement.addBatch();
                    }
                    result = preparedStatement.executeBatch().length;
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
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