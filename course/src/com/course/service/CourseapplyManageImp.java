package com.course.service;

import java.util.List;

import javax.annotation.Resource;

import com.course.dao.ICourseapplyDao;
import com.course.entity.Courseapply;

public class CourseapplyManageImp implements ICourseapplyManage {
	
	@Resource
	private ICourseapplyDao courseapplyDao;

	public ICourseapplyDao getCourseapplyDao() {
		return courseapplyDao;
	}

	public void setCourseapplyDao(ICourseapplyDao courseapplyDao) {
		this.courseapplyDao = courseapplyDao;
	}
	
	@Override
	public void addCourseapply (Courseapply courseapply){
		courseapplyDao.addCourseapply(courseapply);
	}
	
	@Override
	public void modifyCourseapply(Courseapply courseapply){
		courseapplyDao.modifyCourseapply(courseapply);
	}
	
	@Override
	public void deleteCourseapply(Courseapply courseapply){
		courseapplyDao.deleteCourseapply(courseapply);
	}
	
	@Override
	public List<Courseapply> queryAllCourseapply(){
		return courseapplyDao.queryAllCourseapply();
	}
	
	@Override
	public void commitCourseapply(Courseapply courseapply){
		courseapplyDao.commitCourseapply(courseapply);
	}
	
	@Override
	public List<Courseapply> queryAllCourseapproval(){
		return courseapplyDao.queryAllCourseapproval();
	}
	
	@Override
	public void approvalCourseapply(Courseapply courseapply){
		courseapplyDao.approvalCourseapply(courseapply);
	}
	
}