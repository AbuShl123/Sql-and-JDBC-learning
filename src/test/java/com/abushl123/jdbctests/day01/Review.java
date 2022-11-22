package com.abushl123.jdbctests.day01;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Review {
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
    public void work() throws SQLException{
        // to jump first row
        res.next();
        Map<String,Object> rowMap1 = new HashMap<>();

        ResultSetMetaData resMetaData = res.getMetaData();


        System.out.println("----ROW MAP 1 ");
        rowMap1.put(resMetaData.getColumnName(1), res.getString(1));
        rowMap1.put(resMetaData.getColumnName(2), res.getString(2));
        rowMap1.put(resMetaData.getColumnName(3),res.getString(3));

        System.out.println(rowMap1);


        res.next();
        Map<String,Object> rowMap2=new HashMap<>();

        System.out.println("----ROW MAP 2 ");
        rowMap2.put(resMetaData.getColumnName(1), res.getString(1));
        rowMap2.put(resMetaData.getColumnName(2), res.getString(2));
        rowMap2.put(resMetaData.getColumnName(3),res.getString(3));

        System.out.println(rowMap2);

        /*
         *
         * It will continue till the end of the List
         * Assume that we have 107 map
         * Create an ArrayList and put all Maps into List
         */

        List<Map<String,Object>> dataList=new ArrayList<>();

        dataList.add(rowMap1);
        dataList.add(rowMap2);

        System.out.println(dataList);

        // give me last name of Steven
        System.out.println(dataList.get(0).get(resMetaData.getColumnName(2)));


        while (res.next()) {
            Map<String, Object> rowMap = new HashMap<>();
            for (int i = 1; i < resMetaData.getColumnCount(); i++) {
                rowMap.put(resMetaData.getColumnName(i), res.getString(i));
            }

            dataList.add(rowMap);
        }

        for (Map<String, Object> val : dataList) {
            System.out.println(val);
        }
    }
}
