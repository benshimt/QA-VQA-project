# Probing the Abilities of LLMs to Address Presupposition Conflicts in Visual Question Answering

This project explores the capabilities of large language models (LLMs) to handle presupposition conflicts in visual question answering tasks. The work involves multiple tasks that examine **question classification**, **counterfactual reasoning**, **image-based question answering**, **caption generation**, and **caption classification**.

---

### Tasks

#### 1. **QA & Counterfactual**
- **QA Task**: Classify questions as either "tricky" or "normal."
- **Counterfactual Task**: Classify tricky questions using virtual reality.
- **Models used**: GPT-4 & LLAMA

#### 2. **VQA - Visual Question Answering**
- **Task**: Answer questions based on images, focusing on tricky and normal images and questions.
- **Models used**: GPT-4 & InstructBLIP

#### 3. **Caption Generation and Classification**
- **Task**: Find the best parameters for caption classification and identify the optimal models among GPT-3.5 Instruct, GPT-3.5 Chat, GPT-4, and the best datasets.
- **Objective**: Classify captions using the best model and generate captions for images (tricky and normal).
- **Models used**: GPT-3.5 Instruct, GPT-3.5 Chat, GPT-4 & InstructBLIP

---

### Directory Structure

Each task has its own directory containing both `data/` and `src/` subdirectories:

- `task_name/data/`: Contains all the data specific to the task.
- `task_name/src/`: Contains the code implementation specific to the task.
