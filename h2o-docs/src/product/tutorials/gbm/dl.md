#Deep Learning Tutorial

The purpose of this tutorial is to walk new users through Deep Learning using H2O Flow. 
Users who have never used H2O before should refer to [Getting Started](https://github.com/h2oai/h2o-dev/blob/master/h2o-docs/src/product/flow/README.md) for additional instructions on how to run H2O Flow. 

###Using Deep Learning

H2O’s Deep Learning functionalities include:
- model checkpointing for reduced run times and model tuning


### Getting Started
This tutorial uses the publicly available [MNIST](http://yann.lecun.com/exdb/mnist/) data set of hand-written digits, where each row contains the 28^(2)=784 raw gray-scale pixel values from 0 to 255 of the digitized digits (0 to 9). 

To further explore H2O's capabilities, some [publicly available data sets](http://docs.h2o.ai/resources/publicdata.html) can be found on our website. 


####Importing Data
Before creating a model, import the data into H2O:

0. Click the **Assist Me!** button in the *Help* tab in the sidebar on the right side of the page. 

 ![Assist Me button](../images/AssistButton.png)

0. Click the **importFiles** link and enter the file path to the training dataset in the **Search** entry field, or drag and drop the file onto the **Search** entry field. 

  **NOTE**: Deep Learning requires a training dataset and a validation (or testing) dataset. Make sure to upload and parse both datasets before creating a model. 

  ![Importing Testing Data](../images/DL_importFile_test.png)

0. Click the **Add all** link to add the file to the import queue, then click the **Import** button. 

  ![Importing Training Data](../images/DL_importFile_train.png)


####Parsing Data

Now, parse the imported data: 

0. Click the **Parse these files...** button. 
**Note**: The default options typically do not need to be changed unless the data does not parse correctly. 
0. From the drop-down **Parser** list, select the file type of the data set (Auto, XLS, CSV, or SVMLight). 
0. If the data uses a separator, select it from the drop-down **Separator** list. 
0. If the data uses a column header as the first row, select the **First row contains column names** radio button. If the first row contains data, select the **First row contains data** radio button. You can also select the **Auto** radio button to have H2O automatically determine if the first row of the dataset contains the column names or data. 
0. If the data uses apostrophes ( `'` - also known as single quotes), check the **Enable single quotes as a field quotation character** checkbox. 
0. To delete the imported dataset after the parse is complete, check the **Delete on done** checkbox. 

  **NOTE**: In general, we recommend enabling this option. Retaining data requires memory resources, but does not aid in modeling because unparsed data can’t be used by H2O.

0. Review the data in the **Data Preview** section, then click the **Parse** button.  

  ![Parsing Data](../images/DL_Parse.png)
  
  **NOTE**: Make sure the parse is complete by clicking the **View Job** button and confirming progress is 100% before continuing to the next step, model building. For small datasets, this should only take a few seconds, but larger datasets take longer to parse.

##Building a Model

0. Once data are parsed, click the **Assist Me!** button, then click **buildModel**. 
0. Select `deeplearning` from the drop-down **Select an algorithm** menu, then click the **Build model** button. 
0. If the parsed training data is not already listed in the **Training_frame** drop-down list, select it. 

  **Note**: If the **Ignore\_const\_col** checkbox is checked, a list of the excluded columns displays below the **Training_frame** drop-down list. 

0. From the drop-down **Validation_frame** list, select the parsed testing (validation) data. 
0. From the **Ignored_columns** section, select the columns to ignore in the *Available* area to move them to the *Selected* area. For this example, do not select any columns. 
0. From the drop-down **Response** list, select the last column (`C785`). 
0. From the drop-down **Activation** list, select the activation function (for this example, select `Tanh`). 
0. In the **Hidden** field, specify the hidden layer sizes (for this example, enter `50,50`). 
0. In the **Epochs** field, enter the number of times to iterate the dataset (for this example, enter `0.1`). 
0. Click the **Build Model** button.

  ![Building Models](../images/DL_BuildModel.png)

##Results

 To view the results, click the **View** button. The output for the Deep Learning model displays the scoring history, the training metrics, and the status of the neuron layers. 
  
   ![Viewing Model Results](../images/DL_Results.png)
   
 For more details, click the **Inspect** button. 
 
  ![Inspecting Results](../images/DL_Inspect.png)
  
 
 Select the appropriate link to view details for: 
 
 - Neuron layer status
 - Scoring history
 - Training metrics
 - Training metrics confusion matrix
 - Validation metrics
 - Validation metrics confusion matrix

The training metrics confusion matrix is shown below. 

   ![Training Metrics Confusion Matrix](../images/DL_Inspect_Conf.png)