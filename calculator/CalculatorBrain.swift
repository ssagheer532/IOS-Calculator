//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Ahad Sagheer on 12/25/16.
//  Copyright © 2016 Ahad Sagheer. All rights reserved.
//


import Foundation

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}
class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand(operand: Double){
        
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
       // "x" : Operation.BinaryOperation(multiply),
        "x" : Operation.BinaryOperation({$1 * $0}),//$1 and $0 are default arguments and swift knows this returns a double becuse of the enum below
        "+" : Operation.BinaryOperation({$1 + $0}),//$1 and $0 are default
        "-" : Operation.BinaryOperation({$0 - $1}),//$1 and $0 are default
        "±" : Operation.unaryOperation({0-$0}),//bug at unary operation
        "/" : Operation.BinaryOperation({$1 / $0}),//$1 and $0 are default

        "=" : Operation.Equals,
        
    ]
    enum Operation {
        
        case Constant(Double)
        case unaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        //case Decimal
    }
    
    func performeOperation(symbol: String){
        if let operation = operations[symbol]{//use if let because let variable can be nil which may cause issues (other solution is !)
            switch operation {
            case .Constant(let value): accumulator = value
            case .unaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePending()//this lets you use more than two numbers for an operation
                pending = PendingInfo(binaryFunction: function, firstOp: accumulator)
               // print("function\(pending?.binaryFunction) \(pending?.firstOp)")
            case .Equals:
                executePending()
           // case .Decimal: break//concat stuff together
                
            }
        }
    }
    
    func executePending(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOp, accumulator)
            pending = nil
        }
    
    }
    private var pending: PendingInfo?
    struct PendingInfo{
        var binaryFunction: (Double, Double) -> Double
        var firstOp: Double
    }
    
    
    var result: Double {
//        print(accumulator)

        let answer = accumulator
        accumulator = 0
        //print(accumulator)

            return answer
        
    }
}
