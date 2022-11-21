package com.abushl123.jdbctests.day01;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.*;

public class FlexibleNavigation {
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
        statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // res -- starts only data (no table headers info)
        res = statement.executeQuery("select * from EMPLOYEES");
    }

    @AfterAll
    static void tearDown() throws SQLException {
        res.close();
        statement.close();
        connection.close();
    }

    @Test
    public void work() throws SQLException {
        res.next();
        for (int i = 0; i < 10; i++, res.next())
            System.out.println(res.getString("FIRST_NAME") + " - " + res.getString("LAST_NAME"));

        System.out.println("--------------------------------------");

        res.last();
        System.out.println(res.getString("FIRST_NAME") + " - " + res.getString("LAST_NAME"));

        int numberOfLastRow = res.getRow();
        System.out.println(numberOfLastRow);

        res.absolute(4); // jumps into the specified row (returns a boolean: true if this row exists and
        // false if the provided row doesn't exist, and it's not possible to navigate to this row
        System.out.println(res.getRow());
        System.out.println(res.getString("FIRST_NAME") + " - " + res.getString("LAST_NAME"));

    }
}