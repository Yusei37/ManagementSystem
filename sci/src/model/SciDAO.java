package model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class SciDAO {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public SciDAO() {
		
	}
	
	public synchronized List<SciType> listAllSciType() {
		List<SciType> sciTypes = getSession().createQuery("from SciType").list();
		return sciTypes;
	}
	
	public synchronized void addSciType(SciType sciType) {
		getSession().save(sciType);
	}
	
	public synchronized void modifySciType(SciType sciType) {
		getSession().update(sciType);
	}
	
	public synchronized String deleteSciType(String typeId) {
		Query query = getSession().createQuery("from Sci where typeId = ?0");
		query.setParameter(0, typeId);
		List<Sci> scis = query.list();
		if (scis.size() > 0) {
			return "fail";
		}
		SciType sciType = getSession().get(SciType.class, typeId);
		getSession().delete(sciType);
		return "ok";
	}
	
	public synchronized SciType readSciType(String typeId) {
		SciType sciType = getSession().get(SciType.class, typeId);
		return sciType;
	}
	
	public synchronized List<Sci> listAllSci() {
		List<Sci> scis = getSession().createQuery("from Sci").list();
		return appendGroup(scis);
	}
	
	public synchronized List<Sci> getSciListByUserId(String userId) {
		Query query = getSession().createQuery("from Sci where userId = ?0");
		query.setParameter(0, userId);
		List<Sci> scis = query.list();
//		scis = appendGroup(scis);
//		System.out.println(scis);
//		return scis;
		return appendGroup(scis);
	}
	
	public synchronized List<Sci> getSciListUncheckedByUserId(String userId) {
		Query query = getSession().createQuery("from Sci where userId = ?0 and status <> '通过'");
		query.setParameter(0, userId);
		List<Sci> scis = query.list();
		return appendGroup(scis);
	}
	
	public synchronized List<Sci> getSciListCheckedByUserId(String userId) {
		Query query = getSession().createQuery("from Sci where userId = ?0 and status = '通过'");
		query.setParameter(0, userId);
		List<Sci> scis = query.list();
		return appendGroup(scis);
	}
	
	public synchronized List<Sci> getSciListUnchecked() {
		Query query = getSession().createQuery("from Sci where status = '待审核'");
		List<Sci> scis = query.list();
		return appendGroup(scis);
	}
	
	public synchronized void addSci(Sci sci) {
		getSession().save(sci);
		Group group = new Group();
	//	group.setId(1);
		group.setWeight(1);
		group.setSciId(sci.getSciId());
		group.setUserId(sci.getUserId());
		addGroup(group);
		
		List<String> groupmember = sci.getGroupmember();
		for (int i=0; i<groupmember.size(); i++) {
			Group gp = new Group();
//			gp.setId(i + 2);
			gp.setWeight(i + 2);
			gp.setSciId(sci.getSciId());
			gp.setUserId(groupmember.get(i));
			addGroup(gp);
		}
	}
	
	public synchronized void modifySci(Sci sci) {
		getSession().update(sci);
		Group group = new Group();
		group.setWeight(1);
		group.setSciId(sci.getSciId());
		group.setUserId(sci.getUserId());
		modifyGroup(group);
		
		List<String> groupmember = sci.getGroupmember();
		if (groupmember.size() == 0) {
			deleteGroup(sci.getSciId(), 2);
			deleteGroup(sci.getSciId(), 3);
		}
		else if (groupmember.size() == 1) {
			deleteGroup(sci.getSciId(), 3);
		}
		
		for (int i=0; i<groupmember.size(); i++) {
			Group gp = new Group();
			gp.setWeight(i + 2);
			gp.setSciId(sci.getSciId());
			gp.setUserId(groupmember.get(i));
			modifyGroup(gp);
		}
	}
	
	public synchronized void modifySci(String sciId, String status) {
		String hql = "update Sci set status = '"+ status +"' where sciId = '" + sciId + "'"; 
		getSession().createQuery(hql).executeUpdate();
		addHistory(sciId, status);
	}
	
	public synchronized void addHistory(String sciId, String result) {
		History history = new History();
		history.setDate(new Date());
		history.setSciId(sciId);
		history.setResult(result);
		getSession().save(history);
	}
	
	public synchronized void deleteSci(String sciId) {
		Sci sci = getSession().get(Sci.class, sciId);
		getSession().delete(sci);
		deleteGroup(sciId);
	}
	
	public synchronized Sci readSci(String sciId) {
		Sci sci = getSession().get(Sci.class, sciId);
		return sci;
	}
	
	public synchronized List<Group> getGroupList() {
		Query query = getSession().createQuery("from Group");
		List<Group> groups = query.list();
		return groups;
	}
	
	public synchronized void addGroup(Group group) {
		getSession().save(group);
	}
	
	public synchronized void modifyGroup(Group group) {
		String hql = "update Group set userId = '"+ group.getUserId() +"' where sciId = '" + group.getSciId() + "' and weight = '"+ group.getWeight()+"'"; 
		int res = getSession().createQuery(hql).executeUpdate();
		if (res == 0) {
			addGroup(group);
		}
//		getSession().merge(group);
//		getSession().update(group);
	}
	
	public synchronized void deleteGroup(String sciId, int weight) {
		String hql = "delete from Group where sciId = '" + sciId + "' and weight = '"+ weight +"'"; 
		getSession().createQuery(hql).executeUpdate();
	}
	
	public synchronized void deleteGroup(String sciId) {
		String hql = "delete from Group where sciId = '" + sciId + "'"; 
		getSession().createQuery(hql).executeUpdate();
//		Group group = getSession().get(Group.class, id);
//		getSession().delete(group);
	}
	
	public synchronized Group readGroup(String id) {
		Group group = getSession().get(Group.class, id);
		return group;
	}
	
	public synchronized List<Sci> appendGroup(List<Sci> scis) {
		for (int i=0; i< scis.size(); i++) {
			String hql = "select userId from Group where sciId = '" + scis.get(i).getSciId() + "' and weight <> '1'";
			Query query = getSession().createQuery(hql);
			List<String> groupmembers = query.list();
			scis.get(i).setGroupmember(groupmembers);
		}
		return scis;
	}
}
