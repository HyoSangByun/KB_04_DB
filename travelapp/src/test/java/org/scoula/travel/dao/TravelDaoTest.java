package org.scoula.travel.dao;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.database.JDBCUtil;

import static org.junit.jupiter.api.Assertions.*;

class TravelDaoTest {

    private TravelDao dao = new TravelDaoImpl();

    /**
     * 모든 테스트 완료 후 데이터베이스 연결 종료
     */
    @AfterAll
    static void tearDown() {
        JDBCUtil.close();
    }


    /**
     * 전체 여행지 개수 조회 기능 테스트
     */
    @Test
    @DisplayName("전체 여행지 개수 조회")
    void getTotalCount() {

        // 전체 여행지 개수 조회
        int count = dao.getTotalCount();
        System.out.println("전체 여행지 개수: " + count);

        // 개수가 0보다 큰지 검증 (데이터가 존재하는지 확인)
        assertTrue(count > 0, "여행지 데이터 없음");
    }
}