package controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import listen.Listen;
import model.User;
import model.UserDAO;

@RestController
@CrossOrigin
public class UserController {
	
	private UserDAO dao = (UserDAO) (Listen.applicationContext.getBean("userDao"));
	
//	@ModelAttribute
//	public void setVaryResponseHeader(HttpServletResponse response) {
//	    response.setHeader("Access-Control-Allow-Origin", "*");
//	}  
	
//	@Override
//	protected void configure (HttpSecurity http) throws Exception {
//	    http.csrf().disable();
//	}
	
	@RequestMapping(value="/user/{userid}",method=RequestMethod.GET)
	public User searchUser(@PathVariable("userid") String userid){
	    //查看数据接收
	    System.out.println("id="+ userid);
	    User user = dao.readUser(userid);
	    System.out.println(user);
	    return user;
	}
	
	@RequestMapping(value="/user",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public String addUser(@RequestBody User user){
	    //查看数据接收
	    System.out.println(user);
	    dao.addUser(user);
	    return "ok";
	}
	
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public List<User> listUser(){
	    return dao.listAllUser();
	}
	
	@RequestMapping(value="/user/{id}",method=RequestMethod.PUT,produces={"application/json;charset=UTF-8"})
	public String modifyUser(@RequestBody User user){
	    dao.saveUser(user);
	    return "ok";
	}
	
	@RequestMapping(value="/user/{id}",method=RequestMethod.DELETE)
	public String deleteUser(@PathVariable("id") String id){
		return dao.deleteUser(id);
	}
}
