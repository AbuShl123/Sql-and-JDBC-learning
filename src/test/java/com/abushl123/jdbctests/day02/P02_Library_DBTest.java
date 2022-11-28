package com.abushl123.jdbctests.day02;

import com.abushl123.jdbctests.utils.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class P02_Library_DBTest {
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username = "library2_client";
    String password = "6s2LQQTjBcGFfDhY";

    @Test
    public void work() {
        DB_Util.createConnection(url, username, password);

        DB_Util.runQuery("select count(*) from books");

        String getDataFromDB = DB_Util.getFirstRowFirstColumn();

        String getDataFromUI = "3963";

        Assertions.assertEquals(getDataFromDB, getDataFromUI);

        DB_Util.destroy();
    }
}
