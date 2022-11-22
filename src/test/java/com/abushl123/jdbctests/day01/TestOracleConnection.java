package com.abushl123.jdbctests.day01;

import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {
        String url = "jdbc:oracle:thin:@3.85.103.221:1521:XE";

        String username = "hr";
        String password = "hr";

        // to connect to a database
        Connection connection = DriverManager.getConnection(url, username, password);

        // for statements
        Statement statement = connection.createStatement();

        // res -- starts only data (no table headers info)
        ResultSet res = statement.executeQuery("select * from REGIONS");

        res.next();

        // get data as an integer
        System.out.println(res.getInt(1));
        // get data as a String
        System.out.println(res.getString(1));

        System.out.println(res.getInt("REGION_ID"));
        System.out.println(res.getString("REGION_ID"));

        // first row
        System.out.println(res.getString(2));
        System.out.println(res.getString("REGION_NAME"));

        // give me 2 row
        res.next();
        System.out.println(res.getString("REGION_ID") + " - " + res.getString(2));

        // 3 row
        res.next();
        System.out.println(res.getString("REGION_ID") + " - " + res.getString(2));
        res.previous(); res.previous();
        while (res.next()){
            System.out.println(res.getInt(1));
            System.out.println(res.getString(2));
        }

        res.close();
        statement.close();
        connection.close();
    }
}
