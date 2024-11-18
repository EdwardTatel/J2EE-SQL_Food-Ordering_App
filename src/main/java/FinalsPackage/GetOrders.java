package FinalsPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class GetOrders {

    public List<Order> getOrdersByUserId(int userId) throws ClassNotFoundException {
        List<Order> orders = new ArrayList<>();
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql_database?useSSL=false", "root", "")) {
            String SELECT_ORDER_SQL = "SELECT * FROM orders WHERE user_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_SQL)) {
                preparedStatement.setInt(1, userId);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String orderNumber = resultSet.getString("order_number");
                    String orderName = resultSet.getString("order_name");
                    float orderPrice = resultSet.getFloat("order_price");
                    int orderQuantity = resultSet.getInt("order_quantity");
                    LocalDateTime orderDateTime = resultSet.getTimestamp("order_date").toLocalDateTime(); 
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy h:mm a");
                    String formattedOrderDate = orderDateTime.format(formatter);
                    Order order = new Order(orderNumber, orderName, orderPrice, orderQuantity, formattedOrderDate); 
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}