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
        "x" : Operation.BinaryOperation(multiply),
        "=" : Operation.Equals,
       // "." : Operation.Decimal
        
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
            case .BinaryOperation(let function): pending = PendingInfo(binaryFunction: function, firstOp: accumulator)
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOp, accumulator)
                }
           // case .Decimal: break//concat stuff together
                
            }
        }
    }
    private var pending: PendingInfo?
    struct PendingInfo{
        var binaryFunction: (Double, Double) -> Double
        var firstOp: Double
    }
    
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
