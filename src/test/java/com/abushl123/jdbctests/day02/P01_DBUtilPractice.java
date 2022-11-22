package com.abushl123.jdbctests.day02;

import com.abushl123.jdbctests.utils.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.Map;

public class P01_DBUtilPractice {
    @Test
    public void work() {
        // create connection
        DB_Util.createConnection();
        // run query
        DB_Util.runQuery("select first_name, last_name, salary from Employees");
        // get results
        System.out.println("Get first column first row data");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("Print all column names: ");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("Print all first names");
        System.out.println(DB_Util.getColumnDataAsList("FIRST_NAME"));

        System.out.println("Git the info from specific row as a map:");
        System.out.println(DB_Util.getRowMap(2));

        System.out.println("Git the info from specific row as a list:");
        System.out.println(DB_Util.getRowDataAsList(2));

        System.out.println("get info from all rows as a map");
        for (Map<String, String> val : DB_Util.getAllRowAsListOfMap()) {
            System.out.println(val);
        }

        // close
        DB_Util.destroy();
    }
}
