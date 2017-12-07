class ReportsController < ApplicationController
    before_action :authenticate_admin!
    def reports
       @volunteers = Volunteer.all
       @hours = Hour.all
       
       hoursPerMonth()
       @monthsNums
       amountSaved()
    end

    def hoursPerMonth ()
        @monthNums = Array.new(12, 0)
        @hours.each do |hr|
            month = hr["weekWorked"]
            month = month.month
            
            
            case month
            when 1
            @monthNums[0] += hr.hoursWorked
            when 2
            @monthNums[1] += hr.hoursWorked
            when 3
            @monthNums[2] += hr.hoursWorked
             when 4
            @monthNums[3] += hr.hoursWorked
             when 5
            @monthNums[4] += hr.hoursWorked
            when 6
            @monthNums[5] += hr.hoursWorked
            when 7
            @monthNums[6] += hr.hoursWorked
            when 8
            @monthNums[7] += hr.hoursWorked
            when 9
            @monthNums[8] += hr.hoursWorked
            when 10
            @monthNums[9] += hr.hoursWorked
            when 11
            @monthNums[10] += hr.hoursWorked
            when 12
            @monthNums[11] += hr.hoursWorked
            else
            puts "didnt work"
            end
            
            
            
        end

    end

    def amountSaved 
        @amountSaved = Array.new(12, 0)
        count = 0
        @monthNums.each do |num|
            
            @amountSaved[count] = (num * 23)
            count += 1
        end 
    end

end
