package com.coursemanage.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.coursemanage.dao.ICourseDao;
import com.coursemanage.entity.Course;

public class CourseManageImp implements ICourseManage {

	@Resource  
	private ICourseDao courseDao;	
	
	public ICourseDao getCourseDao() {
		return courseDao;
	}

	public void setCourseDao(ICourseDao courseDao) {
		this.courseDao = courseDao;
	}

	@Override
	public void addCourse(Course cos) {
		System.out.println("------CourseManageImp.addCourse------");
		courseDao.addCourse(cos);
	}

	@Override
	public void modifyCourse(Course cos) {
		System.out.println("------CourseManageImp.modifyCourse------");
		courseDao.modifyCourse(cos);
	}


	@Override
	public void deleteCourse(Course cos) {
		System.out.println("------CourseManageImp.deleteCourse------");
		courseDao.deleteCourse(cos);
	}

	@Override
	public List<Course> queryCourse(Course cos, Date begin_time, Date end_time) {
		System.out.println("------CourseManageImp.queryCourse------");
		return courseDao.queryCourse(cos, begin_time, end_time);
	}

}
