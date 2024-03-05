//
//  Strings+Extension.swift
//  SwiftUtilsKit
//
//  Created by Jader Nunes on 15/10/21.
//

public extension String {
    
    /// This is the list that we use as a default value to remove(character:...) function
    /// - Returns: [" ", "+", "-", "(", ")", "."]
    static let defaultCharactersToRemove: [Character] = [" ", "+", "-", "(", ")", "."]
    
    /// It removes: empty *+* *-*  *(* *)* *.*
    /// - Note: Normalize is something when we want to remove all unnecessary information from the text. Like punctuation, accents, special characters, etc.
    /// - Returns: the same string without those characters.
    func removeCharacters(_ characters: [Character] = defaultCharactersToRemove) -> String {
        filter { !characters.contains($0) }
    }
    
    func onlyNumbers() -> String {
        filter { $0.isNumber }
    }
}
