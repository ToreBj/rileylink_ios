//
//  ChangeBolusWizardSetupPumpEvent.swift
//  RileyLink
//
//  Created by Pete Schwamb on 8/29/16.
//  Copyright © 2016 Pete Schwamb. All rights reserved.
//

import Foundation

public struct ChangeBolusWizardSetupPumpEvent: TimestampedPumpEvent {
    public let length: Int
    public let rawData: Data
    public let timestamp: DateComponents
    
    public init?(availableData: Data, pumpModel: PumpModel) {
        length = 39
        
        guard length <= availableData.count else {
            return nil
        }
        
        rawData = availableData.subdata(in: 0..<length)
        
        timestamp = DateComponents(pumpEventData: availableData, offset: 2)
    }
    
    public var dictionaryRepresentation: [String: Any] {
        return [
            "_type": "ChangeBolusWizardSetup",
        ]
    }
}
