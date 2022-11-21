package com.abushl123.jdbctests.day01;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.*;

public class PO1_JDBCIntro {
    private static final String url = "jdbc:oracle:thin:@3.85.103.221:1521:XE";
    private static final String username = "hr";
    private static final String password = "hr";
    private static Connection connection;
    private static Statement statement;
    private static ResultSet res;

    @BeforeAll
    static void settingUp() throws SQLException {
        // to connect to a database
        connection = DriverManager.getConnection(url, username, password);
        // for statements
        statement = connection.createStatement();
        // res -- starts only data (no table headers info)
        res = statement.executeQuery("select * from DEPARTMENTS");
    }
    @AfterAll
    static void tearDown() throws SQLException {
        res.close();
        statement.close();
        connection.close();
    }

    @Test
    public void work() throws SQLException {
        while (res.next()) {
            System.out.println(res.getInt(1) + " - " + res.getString(2)
            + " - " + res.getInt(3) + " - " + res.getInt(4));
        }
    }

    @Test
    public void work2() throws SQLException {
        res = statement.executeQuery("select * from REGIONS");
        while (res.next())
            System.out.println(res.getInt(1) + " - " + res.getString(2));
    }
}
