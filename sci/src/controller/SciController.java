package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import model.Sci;
import model.SciDAO;
import model.SciType;

@RestController
@CrossOrigin
public class SciController {
	
	private SciDAO dao = (SciDAO) (Listen.applicationContext.getBean("sciDao"));
	
//	@ModelAttribute
//	public void setVaryResponseHeader(HttpServletResponse response) {
//	    response.setHeader("Access-Control-Allow-Origin", "*");
//	}  
	
	@RequestMapping(value="/sci",method=RequestMethod.GET)
	public List<Sci> getSciList(){
		return dao.listAllSci();
	}
	
	@RequestMapping(value="/sci/unchecked",method=RequestMethod.GET)
	public List<Sci> getSciListUnchecked(){
		return dao.getSciListUnchecked();
	}
	
	@RequestMapping(value="/sci/unchecked/{userid}",method=RequestMethod.GET)
	public List<Sci> getSciListUncheckedByUserId(@PathVariable("userid") String userId){
		return dao.getSciListUncheckedByUserId(userId);
	}
	
	@RequestMapping(value="/sci/checked/{userid}",method=RequestMethod.GET)
	public List<Sci> getSciListCheckedByUserId(@PathVariable("userid") String userId){
		return dao.getSciListCheckedByUserId(userId);
	}
	
	@RequestMapping(value="/sci",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public String addSci(@RequestBody Sci sci) {
		System.out.println(sci);
		Date d = new Date();
		DateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		sci.setSciId(format.format(d));
		System.out.println(sci);
		dao.addSci(sci);
		
		return "ok";
	}
	
	@RequestMapping(value="/sci/{sciid}",method=RequestMethod.DELETE)
	public String deleteSci(@PathVariable("sciid") String sciId){
		dao.deleteSci(sciId);
	    return "ok";
	}
	
	@RequestMapping(value="/sci/{sciid}",method=RequestMethod.PUT,produces={"application/json;charset=UTF-8"})
	public String modifySci(@RequestBody Sci sci){
		System.out.println(sci);
	    dao.modifySci(sci);
	    return "ok";
	}
	
	@RequestMapping(value="/sci/{sciid}/status",method=RequestMethod.PATCH,produces={"application/json;charset=UTF-8"})
	public String check(@PathVariable("sciid") String sciId, @RequestBody String status){
		System.out.println(sciId);
	    dao.modifySci(sciId, status);
	    return "ok";
	}
	
	@RequestMapping(value="/sciType",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public String addSciType(@RequestBody SciType sciType) {
		dao.addSciType(sciType);
		return "ok";
	}
	
	@RequestMapping(value="/sciType/{typeid}",method=RequestMethod.DELETE)
	public String deleteSciType(@PathVariable("typeid") String typeId){		
	    return dao.deleteSciType(typeId);
	}
	
	@RequestMapping(value="/sciType/{typeid}",method=RequestMethod.PUT,produces={"application/json;charset=UTF-8"})
	public String modifySciType(@RequestBody SciType sciType){
	    dao.modifySciType(sciType);
	    return "ok";
	}
	
	@RequestMapping(value="/sciType",method=RequestMethod.GET)
	public List<SciType> getSciTypeList(){
		return dao.listAllSciType();
	}
}
