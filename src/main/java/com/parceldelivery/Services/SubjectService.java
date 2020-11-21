package com.parceldelivery.Services;

import com.parceldelivery.Model.Subject;
import com.parceldelivery.Repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SubjectService {

    @Autowired
    SubjectRepository subjectRepository;

    public List<Subject> getAllSubjects() {
        List<Subject> subjects = new ArrayList<Subject>();
        for (Subject subject : subjectRepository.findAll()) {
            subjects.add(subject);
        }
        return subjects;
    }

    public boolean saveBatch(Subject subject) {
        subjectRepository.save(subject);
        return true;
    }

    public Subject findBySubjectId(int id){
        return subjectRepository.findById(id);
    }



    public void deleteSubject(Subject subject) {
        subjectRepository.delete(subject);
    }

    public Subject updateSubject(Integer subjectID, Subject newSubject) {
        if (subjectRepository.existsById(subjectID) ){
            Subject subject1 = subjectRepository.findById(subjectID).get();
            subject1.setLecturer_email(newSubject.getLecturer_email());
            subject1.setSubjectname(newSubject.getSubjectname());
            subjectRepository.save(subject1);
            return subject1;
        } else {
            return null;
        }

    }



}
