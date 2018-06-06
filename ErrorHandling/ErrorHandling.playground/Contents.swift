
import UIKit

/** Design Error */
enum FileMissing: Error {
    case fileNotFound
    case filePathNotFound
}

/**
 * Check If File Exist ?? Do your Task : Throws Error
 - Parameter fileName: File you want to search for.
 */
func checkForFile(fileName: String) throws {
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    let url = NSURL(fileURLWithPath: path)
    if let pathComponent = url.appendingPathComponent(fileName) {
        let filePath = pathComponent.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            print("FILE AVAILABLE")
            /* Do Your Task */
        } else {
            throw FileMissing.fileNotFound
        }
    } else {
        throw FileMissing.filePathNotFound
    }
}

/** Calling checkForFile function */
do {
    try checkForFile(fileName: "MyFile")
} catch FileMissing.fileNotFound {
    print("File Not found with this name")
} catch FileMissing.filePathNotFound {
    print("File path not found")
} catch {
    // Some unknown error occured
    print("Some Error Occured")
}


// ******** Error Handling with object Initialiation ********

enum SubjectError : Error {
    case noSuchSubject
}

class MyClassSubjects {
    var subjectName: String
    
    init(subjectName: String) throws {
        
        if subjectName == "" {
            throw SubjectError.noSuchSubject
        } else {
            self.subjectName = subjectName
            print("Your Class Subject is \(subjectName)")
        }
    }
}

do {
    let classCourse = try MyClassSubjects(subjectName: "")
} catch SubjectError.noSuchSubject {
    print("Ohh!! you forgot to give your cours name")
}


// ShortHand Method
// But this will not return you any thrown error
// thrown error = nil
let myCourse = try? MyClassSubjects(subjectName: "")

// This will return nither nil nor some context but will crash or show error.
let myCrashCourse = try! MyClassSubjects(subjectName: "Something")

