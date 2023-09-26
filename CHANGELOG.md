## 0.0.1

- Initial release.

## 0.0.2

- Rename to flutter_penta_core

## 0.0.3

- Update README.md

## 0.0.4

- BaseView replaced with BaseViewMVVMWithMobx and extended with BaseViewMVVM.
- BaseViewMVVMWithMobx is used with mobx.
- New a BaseView added.
- BaseViewMVVM added.
- NotFoundPage edited.
  - appBar (optional)
  - goBack (optional)
  - goBackWidget (optional)

## 0.0.5

- Fixed Bug: BaseView and BaseViewMVVMWithMobx
  - import problem fixed.

## 0.0.6

- Fixed Bug: ResponsiveWidget
  - mounted problem fixed.
- Extensions added. **([ReadMe ➡️ Extension](README.md#-extensions))**

## 0.1.0

- Update CHANGELOG.md from 0.0.6

## 0.1.1

- Added new extension: Boolean **([Extensions](README.md#-extensions))**
  - xor
  - xnor
  - nand
  - nor
  - not (getter)
  - not ~ (operator)

## 0.1.2

- `Penta` prefix added to everything in the package.
  - Example: `BaseView` -> `PentaBaseView`
- NotFoundPage edited.

## 0.1.3

- Fixed Bug: **([Extensions](README.md#-extensions))** -> dynamicOrientationSize (BuildContext)
  - Wrong `dynamicOrientationSize` values fixed.
