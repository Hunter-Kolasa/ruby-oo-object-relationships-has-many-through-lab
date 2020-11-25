class Patient
    attr_accessor :name, :doctor
    @@all = []
    def initialize(name)
        @name = name
        save
    end
    def save
        if @@all.none? {|existing_patient| existing_patient == name}
            @@all << self
        end
    end
    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appt| appt.patient == self}
    end
    def doctors
        appointments.map {|appt| appt.doctor}
    end
    def self.all
        @@all
    end


end

