package com.parceldelivery.Services;

import com.parceldelivery.Repository.ClassroomRepository;
import com.parceldelivery.Model.Classroom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClassroomService {

    @Autowired
    ClassroomRepository classroomRepository;

    public List<Classroom> getAllClassrooms() {
        List<Classroom> classrooms = new ArrayList<Classroom>();
        for (Classroom classroom : classroomRepository.findAll()) {
            classrooms.add(classroom);
        }
        return classrooms;
    }

    public boolean saveBatch(Classroom classroom) {
        classroomRepository.save(classroom);
        return true;
    }

    public Classroom findClassroomById(int id){
        return classroomRepository.findById(id);
    }

    public void deleteClassroom(Classroom classroom) {
        classroomRepository.delete(classroom);
    }



    @PutMapping("/userStatus/{customerID}")
    @CrossOrigin
    @ResponseStatus(HttpStatus.OK)
    public void updateCustomer(@RequestBody Classroom classroom, @PathVariable("customerID") int customerID) {
    }
    public Classroom updateClassroom(Integer classId, Classroom newClassroom)
    {
        if(classroomRepository.existsById(classId)) {
            Classroom classroom1 = classroomRepository.findById(classId).get();
            classroom1.setCapacity(newClassroom.getCapacity());
            classroom1.setClassroomName(newClassroom.getClassroomName());
            classroomRepository.save(classroom1);
            return classroom1;
        }else
        {
            return null;
        }

    }
}
