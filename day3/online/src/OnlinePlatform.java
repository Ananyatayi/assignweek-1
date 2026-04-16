class User {
    protected int userId;
    protected String name;

    public User(int userId, String name) {
        this.userId = userId;
        this.name = name;
    }

    void login() {
        System.out.println(name + " logged in successfully");
    }

    void displayUser() {
        System.out.println("\n===== User Details =====");
        System.out.println("User ID   : " + userId);
        System.out.println("Name      : " + name);
    }
}

class Instructor extends User {
    protected String subject;
    protected int yearsOfExperience;

    public Instructor(int userId, String name, String subject, int yearsOfExperience) {
        super(userId, name);
        this.subject = subject;
        this.yearsOfExperience = yearsOfExperience;
    }

    void uploadCourse() {
        System.out.println("\nCourse uploaded for subject: " + subject);
    }

    void conductSession() {
        System.out.println("Session conducted on " + subject);
    }

    void displayInstructor() {
        super.displayUser();
        System.out.println("Subject   : " + subject);
        System.out.println("Experience: " + yearsOfExperience + " years");
    }
}

class SeniorInstructor extends Instructor {
    private int mentorBatchCount;
    private String specialization;

    public SeniorInstructor(int userId, String name, String subject,
                            int yearsOfExperience, int mentorBatchCount, String specialization) {
        super(userId, name, subject, yearsOfExperience);
        this.mentorBatchCount = mentorBatchCount;
        this.specialization = specialization;
    }

    void reviewContent() {
        System.out.println("Reviewing course content...");
    }

    void assignInstructorTasks() {
        System.out.println("Assigning tasks to instructors...");
    }

    void displayFullProfile() {
        System.out.println("\n===== Senior Instructor Profile =====");
        super.displayInstructor();
        System.out.println("Mentor Batches : " + mentorBatchCount);
        System.out.println("Specialization : " + specialization);
    }
}

public class OnlinePlatform {
    public static void main(String[] args) {

        SeniorInstructor si = new SeniorInstructor(
                101, "Pravi", "Physics", 5, 4, "Quantum Mechanics"
        );

        si.login();
        si.uploadCourse();
        si.conductSession();
        si.reviewContent();
        si.assignInstructorTasks();
        si.displayFullProfile();
    }
}