//
//  main.swift
//  L6_KazkovAleksei
//
//  Created by Алексей Казаков on 10/12/2018.
//  Copyright © 2018 Алексей Казаков. All rights reserved.
//

import Foundation


class Rectangle {
    var sideA: Int
    var sideB: Int
    var square: Int { // подсчет площади. нужен для сравнения фигур
        return sideA * sideB
    }
    
    init (sideA: Int, sideB: Int) {
        self.sideA = sideA
        self.sideB = sideB
    }
    
    convenience init (side: Int){ // делаю вспомогательный конструктор для квадрата
        self.init(sideA: side, sideB: side)
    }
    
}

extension Rectangle: CustomStringConvertible {
    var description: String{
        return "Прямоугольник со сторонами: A: \(sideA) и B: \(sideB) \n"
    }
}

extension Rectangle: Comparable { //имплементирую протокол для сравнения прямоугольников
    static func <(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.square < rhs.square
    }
    
    static func >(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.square > rhs.square
    }
    
    static func <=(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.square <= rhs.square
    }
    
    static func >=(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.square >= rhs.square
    }
    
    static func ==(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.square == rhs.square
    }
}

struct Queue { // создаю структуру типа очередь
    private var elements: [Rectangle] = []
    
    mutating func push(_ element: Rectangle){
        elements.append(element)
    }
    
    mutating func pop() -> Rectangle? { //Извлекаю первый элемент
        return elements.removeFirst()
    }
    
    mutating func sortLow() { // добавляю метод высшего порядка сортировка. он сортирует все элементы по убыванию их площади
        return elements.sort { $0 > $1 }
    }
    
    
    // Эта функция по какой то причине не работает. я не смог разобраться почему. Подскажите, в чем проблема?
    mutating func filterOdd() -> [Rectangle] {// добавляю метод высшего порядка, который после фильтрации оставит только фигуры с четной площадью
        return elements.filter { $0.square % 2 == 0 }
    }
    
    subscript (elements: Int ...) -> Int{ // Делаю сабскрипт, который считает сумму площадей указанных элементов
        var squareSumm = 0
        
        for index in elements {
            if index >= self.elements.count{ // проверка. если элемента с указанным порядковым номером нет в массиве - выводится ошибка
                print("Элемента под номером \(index) нет в массиве, сумма площадей остальных элементов:")
            } else {
                squareSumm += self.elements[index].square
            }
        }
        return squareSumm
    }
}

var queueRectangle = Queue()


// набиваем массив значениями
queueRectangle.push(Rectangle(side: 5))
queueRectangle.push(Rectangle(sideA: 10, sideB: 12))
queueRectangle.push(Rectangle(sideA: 8, sideB: 24))
queueRectangle.push(Rectangle(side: 32))
queueRectangle.push(Rectangle(side: 11))

print("===================== Результат добавления элементов =======================")

print(queueRectangle)

print("=================== Результат удаления первого элемента ========================")

queueRectangle.pop() //убираем первое значение

print(queueRectangle)

print("==================== Результат сортировки элементов =========================")

queueRectangle.sortLow()

print(queueRectangle)

print("===================== Работаем с сабскриптом ==============================")

print(queueRectangle[0, 3, 10])


//print("==================== Убираем из массива фигуры с нечетной площадью ==========")
//
//queueRectangle.filterOdd()
//
//print(queueRectangle)
