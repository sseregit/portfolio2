package web_bootstrap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iot.pf.dto.Board;
import com.iot.pf.service.BoardService;
import com.iot.pf.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/resources-common/applicationContext-datasource.xml",
		"file:src/main/resources-common/applicationContext-beans.xml"		
})

public class UserTest {

	@Autowired
	UserService us;
	
	@Autowired
	BoardService bs;
	
	@Test
	public void insetTest2() {
		
		Board board = new Board();
		
	
		board.setUserId("테스트용 입니다 ");
		board.setName("테스트용 입니다 ");
		board.setTitle("테스트용 입니다 " );
		board.setContent("테스트용 입니다 ");
		
		
	
	
	}
	

}
