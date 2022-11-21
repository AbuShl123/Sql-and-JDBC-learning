package com.abushl123.jdbctests.day01;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.*;

public class MetaDataTest {
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
        DatabaseMetaData metaData = connection.getMetaData();
        System.out.println(metaData.getURL());
        System.out.println(metaData.getUserName());
        System.out.println(metaData.getDriverName());
        System.out.println(metaData.getDatabaseProductName());
        System.out.println(metaData.getDatabaseProductVersion());
        System.out.println(metaData.getDriverVersion());

        ResultSetMetaData resMetaData = res.getMetaData();
        int columnCount = resMetaData.getColumnCount();
        System.out.println(columnCount);


        for (int i = 1; i < columnCount; i++) {
            System.out.println(resMetaData.getColumnName(i));
        }

        // employee id - 1
        // first name = Steven
        while (res.next()){
            for (int i = 1; i <= columnCount; i++){
                System.out.print(resMetaData.getColumnName(i) + " - " + res.getString(i) + ", ");
            }
            System.out.println();
        }

    }

}
