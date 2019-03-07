package com.voidmain.dao;

import java.util.ArrayList;
import java.util.List;

import com.voidmain.pojo.Student;
import com.voidmain.pojo.Voting;

public class DAO {

	public static int addStudent(Student student)
	{
		return HibernateTemplate.addObject(student);
	}
	
	public static int deleteStudent(String studentName)
	{
		return HibernateTemplate.deleteObject(Student.class,studentName);
	}
	
	public static int updateStudent(Student student)
	{
		return HibernateTemplate.updateObject(student);
	}
	
	public static Student getStudentById(String studentName)
	{
		return (Student)HibernateTemplate.getObject(Student.class,studentName);
	}
	
	public static List<Student> getStudentsList()
	{
		return (List)HibernateTemplate.getObjectListByQuery("From Student");
	}
	
	public static List<Student> getNominationStudentList()
	{
		List<Student> nominations=new ArrayList<Student>();
		
		List<Student> students=(List)HibernateTemplate.getObjectListByQuery("From Student");
		
		for(Student student : students)
		{
			if(student.getHavingNomination().equals("yes"))
			{
				nominations.add(student);
			}
		}
		
		return nominations;
	}
	
	public static boolean isValidStudent(String studentName,String password)
	{	
		boolean isValid=false;
		
		Student student=getStudentById(studentName);

		if(student!=null && student.getPassword().equals(password) && student.getAccountStatus().equals("yes"))
		{
			isValid=true;
		}
		
		return isValid;
	}
	
	//=============================student ended===========================
	
	public static int addVoting(Voting voting)
	{
		return HibernateTemplate.addObject(voting);
	}
	
	public static int updateVoting(Voting voting)
	{
		return HibernateTemplate.updateObject(voting);
	}
	
	public static Voting getVoteById(int voteId)
	{
		return (Voting)HibernateTemplate.getObject(Voting.class,voteId);
	}
	
	public static List<Voting> getVotingList()
	{
		return (List)HibernateTemplate.getObjectListByQuery("From Voting");
	}
	
	public static int getVotingCountByUserName(String userName)
	{
		int count=0;
		
		List<Voting> votings=getVotingList();
		
		for(Voting voting : votings)
		{
			if(voting.getVotedTo().equals(userName))
			{
				count++;
			}
		}
		
		return count;
	}
	
	public static boolean isVoted(String userName)
	{
		boolean isVoted=false;
		
		List<Voting> votings=getVotingList();
		
		for(Voting voting : votings)
		{
			if(voting.getVotedBy().equals(userName))
			{
				isVoted=true;
			}
		}
		
		return isVoted;
	}
}
