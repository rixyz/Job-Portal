package JobPortal.Model;

public class ReportData {
    String[] months = new String[12];
    int[] employeeCount = new int[12];
    int[] companyCount = new int[12];
    int[] jobCount = new int[12];
    int[] applicationCount = new int[12];
    int[] successCount = new int[12];

    public String[] getMonths() {
        return months;
    }

    public void setMonths(String[] months) {
        this.months = months;
    }

    public int[] getEmployeeCount() {
        return employeeCount;
    }

    public void setEmployeeCount(int[] employeeCount) {
        this.employeeCount = employeeCount;
    }

    public int[] getCompanyCount() {
        return companyCount;
    }

    public void setCompanyCount(int[] companyCount) {
        this.companyCount = companyCount;
    }

    public int[] getJobCount() {
        return jobCount;
    }

    public void setJobCount(int[] jobCount) {
        this.jobCount = jobCount;
    }

    public int[] getApplicationCount() {
        return applicationCount;
    }

    public void setApplicationCount(int[] applicationCount) {
        this.applicationCount = applicationCount;
    }

    public int[] getSuccessCount() {
        return successCount;
    }

    public void setSuccessCount(int[] successCount) {
        this.successCount = successCount;
    }
}
