package com.parceldelivery.Services;

import com.parceldelivery.Repository.AllTimetableRepository;
import com.parceldelivery.Model.AllTimeTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AllTimetableService {

    @Autowired
    private AllTimetableRepository allTimetableRepository;

    public List<AllTimeTable> getBatchSessions(String batchNumber){

        return allTimetableRepository.getAllByBatchNumber(batchNumber);
    }
    public List<AllTimeTable> getLecturerSessions(String Lecturer){
        //System.out.println(Lecturer);
        return allTimetableRepository.getAllByLecturer(Lecturer);
    }
    public List<AllTimeTable> getSubjectSessions(String Subject){
        return allTimetableRepository.getAllBySubject(Subject);
    }
    public List<AllTimeTable> getClassroomSessions(String Classroom){
        return allTimetableRepository.getAllByClassroom(Classroom);
    }

    public void createSession(AllTimeTable allTimeTable){
        allTimetableRepository.save(allTimeTable);
    }

    public boolean saveTimetable(AllTimeTable timetable){
        allTimetableRepository.save(timetable);
        return true;
    }
    public boolean checkExists(String batchNumber, String day, String time){
        AllTimeTable allTimeTable = allTimetableRepository.getAllByBatchNumberAndDayAndTime(batchNumber,day,time);
        if (allTimetableRepository.getAllByBatchNumberAndDayAndTime(batchNumber,day,time) == null){
            return true;
        }else {
            return false;
        }
    }

    public void createSlot(AllTimeTable allTimeTable){
        allTimetableRepository.save(allTimeTable);
    }
}
