package controller;

import java.util.ArrayList;

import dblibrary.project.csci230.UniversityDBLibrary;
import entity.University;

//import stackoverflow.*;
public class UniversityController{
  
    UniversityDBLibrary dblib = new UniversityDBLibrary("stacko", "csci230");
 // private UniversityDBLibrary dblib;
  
  /**
   * recieve the University that will be added to the database
   * pre: university that is added should not already exist
   * 
   * @param universityName the name of the university 
   * @param state the state the university is located in 
   * @param location whether is rural, urban or city
   * @param control whether the school is public or private
   * @param numberOfStudents the number of students at the school
   * @param female the percentage of female students at the school
   * @param SATVerbal the SAT verbal score at the school
   * @param SATMath the SAT math score at the school
   * @param expenses the cost to attend the school
   * @param financialAid the financial aid the school offers for students
   * @param numberOfApplicants the number of students who applied to the school
   * @param admitted the number of students admitted to the school
   * @param enrolled the number of students enrolled at the school
   * @param academicScale the school's academic rating
   * @param socialScale the school's social rating
   * @param qualityOfLifeScale the school's quality of life for students added
   * @throws IllegalArgumentException is the preconditions are not met
   */
  
  public void addUniversity(String schoolName, String state, String location, String control, int numStudents,
                            double female, double satVerb, double satMath, double expenses, double finAid, int numApplicants,
                            double numAdmitted, double numEnrolled, int acaScale, int socScale, int qualityLife, String emp1, String emp2, String emp3){
	  
    dblib.university_addUniversity(schoolName, state, location, control, numStudents,
                                   female, satVerb, satMath, expenses, finAid, numApplicants,
                                   numAdmitted, numEnrolled, acaScale, socScale, qualityLife);
    
    dblib.university_addUniversityEmphasis(schoolName, emp1);
    dblib.university_addUniversityEmphasis(schoolName, emp2);
    dblib.university_addUniversityEmphasis(schoolName, emp3);
    
  }
  /**
   * Allow users to get a list of all saved universities in database.
   */
  public ArrayList<University> getSavedUniversities() {
    
    ArrayList<University> schoolInfo = new ArrayList<University>();
    String[][] school = dblib.university_getUniversities();
    String[][] empArr = dblib.university_getNamesWithEmphases();
    for(int i =0 ; i < school.length; i++){
      ArrayList<String> emphases = new ArrayList<String>();
      for(int j = 0; j < empArr.length; j++){
        if(empArr[j][0].equals(school[i][0])){
          emphases.add(empArr[j][1]);
        }
      }
      University university = new University(school[i][0],school[i][1],school[i][2],school[i][3],Integer.parseInt(school[i][4]),
                                             Double.parseDouble(school[i][5]),Double.parseDouble(school[i][6]),Double.parseDouble(school[i][7]),
                                             Double.parseDouble(school[i][8]),Double.parseDouble(school[i][9]),Integer.parseInt(school[i][10]),
                                             Double.parseDouble(school[i][11]),Double.parseDouble(school[i][12]),Integer.parseInt(school[i][13]),
                                             Integer.parseInt(school[i][14]),Integer.parseInt(school[i][15]));
      schoolInfo.add(university);
      
    }
    return schoolInfo;
  }
  
  /**
   * Allows the Admin to add a user.
   * 
   * @param firstName the first name of user
   * @param lastName the last name of the user
   * @param username the username of the user
   * @param password the password associated with the user
   * @param type the type of user it is
   * 
   */
 // public void addUser(String firstName, String lastName, String username, String password,char type){
  //  dblib.user_addUser(username, firstName, lastName, password, type);
  //}
  
  /**
   * make changes to a university within the database
   * 
   * pre: university must exist in the database
   * @param u the universit that will be modified
   * @throws IllegalArgumentException if the preconditions are not met
   */
//  public void editUniveristy(String u){
//
//  }
  /**
   * view the details for a university
   * 
   * pre: university must exist in the database
   * @param u the university that will be viewed
   * @throws IllegalArgumentException if the preconditions are not met
   * 
   */
  public ArrayList<String> viewUniversityDetails(University u, ArrayList<String> m)
  {
	ArrayList<String> details = new ArrayList<String>();
    if(u instanceof University) {
    details.add(u.getUniversityName());
    details.add(u.getUniversityState());
    details.add(u.getLocationType());
    details.add(u.getControl());
    details.add("" + u.getNumOfStudents());
    details.add("" + u.getFemalePercentage());
    details.add("" + u.getSATVerbal());
    details.add("" + u.getSATMath());
    details.add("" + u.getExpenses());
    details.add("" + u.getFinancialAid());
    details.add("" + u.getNumApplicants());
    details.add("" + u.getNumAdmitted());
    details.add("" + u.getNumEnrolled());
    details.add("" + u.getAcademicScale());
    details.add("" + u.getSocialScale());
    details.add("" + u.getQualityOfLife());
    for(String o: m) {
    	details.add(o);
    }
    return details;
    }
	return details;
    
    
  }
 /**
  * Allows user to get a univeristy and the information associated with it. 
  * 
  * @param schoolName the name of the school the user wants to get the information of
  * 
  * @return an ArrayList of the universities information
  */
 public University getUniversity(String schoolName){
      ArrayList<String> emphases = new ArrayList<String>();
      String[][] arr = dblib.university_getNamesWithEmphases();
      String[][] school = dblib.university_getUniversities();
      University university =null;
            
      for(int i =0 ; i < arr.length; i++){
        if(arr[i][0].equals(schoolName)){
          emphases.add(arr[i][1]);
        }
      }
      for(int i =0 ; i< school.length ; i++){
        if(school[i][0].equals(schoolName)){
          
           university = new University(school[i][0],school[i][1],school[i][2],school[i][3],Integer.parseInt(school[i][4]),
                                                 Double.parseDouble(school[i][5]),Double.parseDouble(school[i][6]),Double.parseDouble(school[i][7]),
                                                 Double.parseDouble(school[i][8]),Double.parseDouble(school[i][9]),Integer.parseInt(school[i][10]),
                                                 Double.parseDouble(school[i][11]),Double.parseDouble(school[i][12]),Integer.parseInt(school[i][13]),
                                                 Integer.parseInt(school[i][14]),Integer.parseInt(school[i][15]));
          return university;
        }
        
      }
      return university;
    }
  
}

