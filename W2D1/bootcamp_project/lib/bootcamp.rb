require "byebug"
class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|h,k|h[k]= []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def student_capacity
        @student_capacity
    end

    def teachers
        @teachers
    end

    def hire(str)
        @teachers << str
    end

    def students
        @students
    end

    def enroll(str)
        if @students.length < @student_capacity
            @students << str
            return true
        else
            return false
        end
    end

    def enrolled?(str)
        @students.include?(str)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(str,n)
        if enrolled?(str)
            @grades[str] << n
            return true
        else
            return false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        if enrolled?(str) && @grades[str].length > 0
           return @grades[str].sum / (num_grades(str))
        end
        nil
    end
end